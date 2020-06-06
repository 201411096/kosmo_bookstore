
package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.mycompany.service.CustomerServiceImpl;
import com.mycompany.service.ReviewServiceImpl;
import com.mycompany.service.TendencyServiceImpl;
import com.mycompany.util.CartList;
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
		//mv.setViewName("/test_login_check"); //테스트 화면 이동
		mv.setViewName("redirect:/moveToLogin.do");
		
		if(result==null) {}
		else if(result.getCustomerFlag()==0) {
			session.setAttribute("customer", result); // 관리자 정보 세팅
			mv.setViewName("/test_admin_check");
		}
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
		System.out.println("LoginController에서 logout.do 실행 확인");
		session.invalidate();
		
		//mv.setViewName("/test_logout_check"); //테스트 화면 이동
		mv.setViewName("redirect:/main.do");
		return mv;
	}
	//회원가입 페이지로 이동
	@RequestMapping("/moveToRegister.do")
	public ModelAndView moveToRegister(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/register");
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
	//성향 그래프를 그리는 함수(아래 함수 나온 뒤로 사용 안함)
	@RequestMapping("/moveToTendencyGraph.do")
	public ModelAndView moveToTendencyGraph(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Tendency.getInstance().getCustomerTendency(session, tendencyService, mv); // 사용자의 장르 선호도
		Tendency.getInstance().getTotalTendency(tendencyService, mv); // 모든 유저의 장르 선호도
		mv.setViewName("tendencyGraph");
		return mv;
	}
	//성향 그래프를 그리면서 가장 많이 읽은 장르의 책과 가장 적게 읽은 장르의 책을 추천하는 함수
	@RequestMapping(value = "/ajaxTendencyGraph.do",  produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map moveToAjaxTendencyGraph(HttpSession session) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		result.put("customerId", customerVO.getCustomerId());
		TendencyVO tendencyVO = tendencyService.selectTendency(customerVO);
		tendencyVO.setElementToPercent();
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
		tendencyVO.setElementToPercent();
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
		ReviewVO reviewVO = reviewService.selectReviewByReviewId(Integer.parseInt(reviewId));
		result.put("customerId", customerVO.getCustomerId());
		result.put("reviewVO", reviewVO);
		return result;
	}
	
}
