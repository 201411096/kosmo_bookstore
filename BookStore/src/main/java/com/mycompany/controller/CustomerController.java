
package com.mycompany.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;
import com.mycompany.domain.TendencyVO;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.CustomerServiceImpl;
import com.mycompany.service.ReviewServiceImpl;
import com.mycompany.service.TendencyServiceImpl;
import com.mycompany.util.CartList;
import com.mycompany.util.SendMail;
import com.mycompany.util.Tendency;


	//Handles requests for the application home page.
 
@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	@Autowired
	CustomerServiceImpl customerService;
	@Autowired
	TendencyServiceImpl tendencyService;
	@Autowired
	ReviewServiceImpl reviewService;	
	@Autowired
	BookServiceImpl bookService;
	@RequestMapping("/moveToLogin.do")
	public ModelAndView moveToLogin(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login");
		if(session.getAttribute("customer")!=null)
			mv.setViewName("redirect:/main.do");
		return mv;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(CustomerVO vo, HttpSession session) {
		//로그인 입력값으로 확인
		CustomerVO result = customerService.selectCustomer(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/moveToLogin.do");
		
		if(result==null) {}
		else {
			//고객 정보를 세팅
			session.setAttribute("customer", result);
			//장바구니 목록 갱신
			CartList.getInstance().setCartList(session, customerService);
			//로그인 성공 시 메인화면으로 이동
			mv.setViewName("redirect:/main.do");
		}
		return mv;
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:/main.do");
		return mv;
	}
	//회원가입 페이지로 이동
	@RequestMapping("/moveToRegister.do")
	public ModelAndView moveToRegister(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/register");
		if(session.getAttribute("customer")!=null)
			mv.setViewName("redirect:/main.do");
		return mv;
	}
	// 회원가입
	@RequestMapping("/register.do")
	public String register(CustomerVO vo, HttpSession session) {
		int result = customerService.insertCustomer(vo);
		//회원가입 성공 시 로그인을 바로 해줌 + 성향 데이터 생성
		if(result==1) {
			session.setAttribute("customer", vo);
			tendencyService.insertTendency(vo);
		}
		return "redirect:/registerCon.do";
	}	
	// 회원가입 확인 페이지로 이동(정보 불러오기)
	@RequestMapping("/registerCon.do")
	public String joinCon(CustomerVO vo, Model model) {
		return "registerCon";
	}
	//성향 그래프를 그리는 함수(ajax 없는 부분에서 사용했었음)
	@RequestMapping("/moveToTendencyGraph.do")
	public ModelAndView moveToTendencyGraph(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Tendency.getInstance().getCustomerTendency(session, tendencyService, mv); // 사용자의 장르 선호도
		Tendency.getInstance().getTotalTendency(tendencyService, mv); // 모든 유저의 장르 선호도
		mv.setViewName("tendencyGraph");
		return mv;
	}
	@RequestMapping("/ajax_tendencyGraph.do")
	public ModelAndView moveToAjaxTendencyGraph(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		if(customerVO==null) {
			mv.setViewName("redirect:/moveToLogin.do");
			return mv;
		}
		mv.setViewName("ajax_tendencyGraph");
		return mv;
	}
	
	//성향 그래프를 그리면서 가장 많이 읽은 장르의 책과 가장 적게 읽은 장르의 책을 추천하는 함수
	@RequestMapping(value = "/ajaxTendencyGraph.do",  produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map drawAjaxTendencyGraph(HttpSession session) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		result.put("customerId", customerVO.getCustomerId());
		
		TendencyVO tendencyVO = tendencyService.selectTendency(customerVO);
		
		Tendency.getInstance().checkTendencyPointInConsole(tendencyVO, "리뷰 포함하기 전의 사용자__1");
		Tendency.getInstance().addReviewPointToCustomerTendency(session, tendencyVO, reviewService, bookService); //장르 성향 그래프를 그릴 경우 사용자의 리뷰도 포함시킴 
		Tendency.getInstance().checkTendencyPointInConsole(tendencyVO, "리뷰 포함 이후 사용자__2");
		tendencyVO.setElementToPercent();
		Tendency.getInstance().checkTendencyPointInConsole(tendencyVO, "사용자 %__3");
		result.put("tendency", tendencyVO);

		int randomIdx=0; // 선택된 장르, 일정 점수 이상으로 가져온 도서 목록중에서 하나를 고르는데 사용할 변수
		BookVO VOForSearch = new BookVO();	// 검색에 사용하는 객체 (장르만을 담고 검색에 사용)
		String maxPrefferedGenre = tendencyVO.getMaxPrefferedGenreConsiderWithSameScore(); // tendencyVO객체 기반의 가장 많이 선호하는 장르를 가져옴
		VOForSearch.setBookGenre(maxPrefferedGenre);										
		List<BookVO> bookListInMaxPrefferedGenre = tendencyService.selectAllByGenreWithScore(VOForSearch);	// 가장 많이 선호하는 장르의 도서 목록을 가져옴
		randomIdx = (int)(Math.random()*bookListInMaxPrefferedGenre.size());
		result.put("bookInMaxPrefferedGenre", bookListInMaxPrefferedGenre.get(randomIdx));
		String minPrefferedGenre = tendencyVO.getMinPrefferedGenreConsiderWithSameScore(); // tendencyVO객체 기반의 가장 적게 선호하는 장르를 가져옴
		VOForSearch.setBookGenre(minPrefferedGenre);
		List<BookVO> bookListInMinPrefferedGenre = tendencyService.selectAllByGenreWithScore(VOForSearch);	// 가장 적게 선호하는 장르의 도서 목록을 가져옴
		randomIdx = (int)(Math.random()*bookListInMinPrefferedGenre.size());
		result.put("bookInMinPrefferedGenre", bookListInMinPrefferedGenre.get(randomIdx));
		
		tendencyVO = tendencyService.selectAllTendency();
		tendencyVO.setCustomerId("AllCustomer");
		
		Tendency.getInstance().checkTendencyPointInConsole(tendencyVO, "리뷰 포함하기 전의 모든 유저__4");
		Tendency.getInstance().addReviewPointToAllUsersTendency(session, tendencyVO, reviewService, bookService); //장르 성향 그래프를 그릴 경우 모든 사용자의 리뷰도 포함시킴
		Tendency.getInstance().checkTendencyPointInConsole(tendencyVO, "리뷰 포함한 후의 모든 유저__5");
		tendencyVO.setElementToPercent();
		Tendency.getInstance().checkTendencyPointInConsole(tendencyVO, "모든 유저 %__6");
				
		result.put("totalTendency", tendencyVO);
		
		return result;
	}
	@RequestMapping(value = "/getLoginCustomerId.do",  produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getLoginCustomerId(HttpSession session) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		result.put("customerId", customerVO.getCustomerId());
		return result;
	}
	@RequestMapping(value = "/getLoginCustomerIdAndReview.do",  produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getLoginCustomerIdAndReview(HttpSession session, @RequestParam(value = "reviewId") String reviewId) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		if(customerVO!=null) {
			ReviewVO reviewVO = reviewService.selectReviewByReviewId(Integer.parseInt(reviewId));
			result.put("customerId", customerVO.getCustomerId());
			result.put("reviewVO", reviewVO);	
		}
		return result;
	}
	
	@RequestMapping(value = "/getLoginCustomerVO.do",  produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getCustomerVO(HttpSession session) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		if(customerVO==null)
			return result;
		else {
			result.put("customerVO", customerVO);
		}
		
		return result;
	}
	
	@RequestMapping("/sendMailForFindPassword.do")
	public ModelAndView sendMailForFindPassword(HttpSession session, CustomerVO customerVO) {
		ModelAndView mv = new ModelAndView();
		
		SendMail sendMail = new SendMail();

		String [] alphabetAndNumber = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O"
										,"P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", 
										"3", "4", "5", "6", "7", "8", "9", "0"};
		String tempPassword="";
		for(int i=0; i<10; i++) {
			int tempIdx = (int)(Math.random()*36);
			tempPassword+=alphabetAndNumber[tempIdx];
		}

		customerVO.setCustomerPassword(tempPassword);
		System.out.println(customerVO.getCustomerId());
		System.out.println(customerVO.getCustomerEmail());
		System.out.println(customerVO.getCustomerPassword());
		sendMail.sendMail(customerVO.getCustomerEmail(), tempPassword);
		int result = customerService.makeTemporaryPassword(customerVO); //만드는 게 아니라 생성된 임시비밀번호로 변경해줌
		if(result==0)
			System.out.println("오류 발생");
		mv.setViewName("redirect:/main.do");
		return mv;
	}
}
