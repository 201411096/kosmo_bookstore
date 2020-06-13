
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
	
	/* 
	 * 함수 이름 : moveToLogin
	 * 주요 기능 : 로그인화면으로 이동
	 * 함수 내용 : --
	 */
	@RequestMapping("/moveToLogin.do")
	public ModelAndView moveToLogin(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login");
		if(session.getAttribute("customer")!=null)
			mv.setViewName("redirect:/main.do");
		return mv;
	}
	/* 
	 * 함수 이름 : login
	 * 주요 기능 : 로그인, 사용자의 장바구니를 세션에 담음
	 * 함수 내용 : 입력한 정보를 확인
	 * 		ㄴ  해당 사용자의 장바구니를 세션에 담음
	 * 			ㄴ 장바구니의 총합 계산해서 담음 (cartListTotalPrice)
	 * 			ㄴ 장바구니의 목록의 개수를 담음 (cartListNumber) (=> A책 2권, B책 3권, C책 1권일 경우 6이 아닌 3을 담음)
	 * 			ㄴ 장바구니 목록을 담음(cartList)
	 * 사용하는 Mapper : CustomerMapper -> selectCustomer
	 * 				  CustomerMapper -> getCartList
	 * 참고사항 : mycompany.util.CartList
	 */	
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
	/* 
	 * 함수 이름 : logout
	 * 주요 기능 : 로그아웃
	 * 함수 내용 : --
	 */
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:/main.do");
		return mv;
	}
	/* 
	 * 함수 이름 : moveToRegister
	 * 주요 기능 : 회원가입 화면으로 이동
	 * 함수 내용 : 로그인 되어 있는 상태라면 메인화면으로 이동, 그게 아니라면 회원가입화면으로 이동
	 */
	@RequestMapping("/moveToRegister.do")
	public ModelAndView moveToRegister(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/register");
		if(session.getAttribute("customer")!=null)
			mv.setViewName("redirect:/main.do");
		return mv;
	}
	/* 
	 * 함수 이름 : register
	 * 주요 기능 : 회원가입
	 * 함수 내용 : 사용자가 입력한 정보에 따라 회원가입
	 * 			ㄴ 회원가입 성공시 로그인도 같이함
	 * 			ㄴ 회원가입 성공시 사용자의 선호 장르 정보를 기록하는 부분도 같이 생성
	 * 사용하는 Mapper : CustomerMapper.xml -> insertCustomer
	 * 				  TendencyMapper.xml -> insertTendency
	 */
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
	/* 
	 * 함수 이름 : joinCon
	 * 주요 기능 : 회원가입 확인 페이지로 이동
	 */
	@RequestMapping("/registerCon.do")
	public String joinCon(CustomerVO vo, Model model) {
		return "registerCon";
	}
	/* ----------- 사용하지 않음 ----------
	 * 함수 이름 : moveToTendencyGraph
	 * 주요 기능 : 선호장르 그래프 페이지로 이동함
	 * 함수 내용 : 사용자의 선호장르 그래프 페이지로 이동
	 * 		ㄴ 사용자의 선호장르 데이터를 가져옴
	 * 		ㄴ 모든 사용자의 선호장르 데이터를 가져옴
	 * 사용한 Mapper : TendencyMapper.xml -> selectTendency		(사용자의 선호장르 데이터를 가져옴)
	 * 				 TendencyMapper.xml -> selectAllTendency	(모든 사용자의 선호장르 데이터를 가져옴) 
	 * 참고사항 : myCompany.util.Tendency
	 */
	@RequestMapping("/moveToTendencyGraph.do")
	public ModelAndView moveToTendencyGraph(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Tendency.getInstance().getCustomerTendency(session, tendencyService, mv); // 사용자의 장르 선호도
		Tendency.getInstance().getTotalTendency(tendencyService, mv); // 모든 유저의 장르 선호도
		mv.setViewName("tendencyGraph");
		return mv;
	}
	/* 
	 * 함수 이름 : moveToAjaxTendencyGraph
	 * 주요 기능 : 선호장르 ajax 그래프 페이지로 이동함
	 * 함수 내용 : 사용자의 로그인 상태를 확인한 후 ajaxTendencyGraph 페이지로 이동함
	 */
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
	/* 
	 * 함수 이름 : drawAjaxTendencyGraph
	 * 주요 기능 : 선호장르 그래프를 그리고 가장 선호하는 장르와 가장 선호하지 않는 장르의 책 중에서 일정 평점이상의 책들을 하나씩 추천
	 * 함수 순서 : 
	 * 		ㄴ 사용자의 선호장르 데이터를 가져옴
	 * 		ㄴ 사용자가 작성한 모든 리뷰의 점수들만큼 해당 장르들의 데이터에 반영함 (db를 건드리지 않음)
	 * 		ㄴ 사용자의 선호장르 데이터를 %로 변환
	 * 		ㄴ %로 변환한 선호장르 데이터를 반환 ( "tendency" )
	 * 		ㄴ 사용자의 선호장르 데이터를 기반으로 가장 선호하는 장르를 받아옴 (데이터의 점수가 동일할 경우 해당 장르들 중 랜덤으로 반환)
	 * 		ㄴ 선호 장르에 해당하면서 평점이 3.0이상인 책들을 모두 가져옴
	 * 		ㄴ 선호 장르 책 리스트 중 한 권을 반환 ( "bookInMaxPrefferedGenre" )
	 * 		ㄴ 비선호 장르의 책도 위의 방법으로 반환 ( "bookInMinPrefferedGenre" )
	 * 		ㄴ 모든 사용자의 선호장르 데이터를 가져옴
	 * 		ㄴ 모든 사용자의 선호장르 데이터도 사용자의 선호장르 데이터를 처리한 방법과 같이 처리 후 반환 ( "totalTendency" )
	 * 사용한 Mapper : TendencyMapper.xml -> selectTendency		(사용자의 선호장르 데이터를 가져옴)
	 * 				 TendencyMapper.xml -> selectAllTendency	(모든 사용자의 선호장르 데이터를 가져옴)
	 * 				 TendencyMapper.xml -> selectAllByGenreWithScore (해당 장르에 해당하는 평점 3이상의 도서 목록을 가져옴)
	 * 				 ReviewMapper.xml -> selectReviewListByCustomerId	(사용자의 모든 리뷰 정보를 가져옴)
	 * 				 ReviewMapper.xml -> selectReviewList		(모든 사용자의 모든 리뷰 정보를 가져옴)
	 * 참고사항 : myCompany.util.Tendency
	 * 				ㄴ addReviewPointToCustomerTendency
	 * 					ㄴ 사용자의 선호 장르를 기록한 데이터에 사용자가 작성해둔 리뷰들의 점수들도 반형
	 * 				ㄴ addReviewPointToAllUsersTendency
	 * 					ㄴ 모든 사용자의 선호 장르를 기록한 데이터에 모든 사용자가 작성해둔 리뷰들의 점수들도 반형
	 * 		   myCompany.domain.TendencyVO
	 * 			ㄴ 가장 선호하는 장르와 가장 선호하지 않는 장르를 구하는 함수, 해당 데이터들을 %로 변환해주는 함수 포함
	 * 				ㄴ getMaxPrefferedGenreConsiderWithSameScore
	 * 					ㄴ 선호장르에 대한 데이터 점수가 동일할 경우 랜덤으로 반환
	 * 				ㄴ getMinPrefferedGenreConsiderWithSameScore
	 * 					ㄴ 선호장르에 대한 데이터 점수가 동일할 경우 랜덤으로 반환
	 * 				ㄴ setElementToPercent
	 * 					ㄴ 선호장르 점수에 대한 데이터를 %로 반환해줌
	 * 반환하는 위치 : custom_ajax_tendencyGraph.js
	 */	
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
	/* ----- 어디서 사용하는지 모름 -----
	 * 함수 이름 : getLoginCustomerId
	 * 주요 기능 : 로그인한 사용자의 Id를 받아옴
	 * 함수 내용 : --
	 */
	@RequestMapping(value = "/getLoginCustomerId.do",  produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getLoginCustomerId(HttpSession session) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		result.put("customerId", customerVO.getCustomerId());
		return result;
	}
	/* 
	 * 함수 이름 : getLoginCustomerId
	 * 주요 기능 : 로그인한 사용자의 Id를 받아옴
	 * 함수 내용 : 리뷰 아이디와 사용자의 정보를 받아서 해당하는 리뷰 정보를 넘겨줌
	 * 부르는 곳 : custom_productView.js
	 */
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
	/* 
	 * ----- 어디서 사용한지 모름 -----
	 * 함수 이름 : getCustomerVO
	 * 주요 기능 : session에 담긴 사용자 정보를 가져옴
	 * 함수 내용 : --
	 */
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
	/* 
	 * 함수 이름 : sendMailForFindPassword
	 * 주요 기능 : 임시비밀번호를 만들어서 사용자 email로 전송함
	 * 함수 내용 : 사용자의 정보를 받아서 영문자+숫자로 이루어진 10자리 문자열을 메일로 발송하고 비밀번호를 해당 임시비밀번호로 설정
	 * 		ㄴ 사용자의 정보(아이디와 이메일)을 받아옴
	 * 		ㄴ 영문자+숫자조합으로 10자리 임시비밀번호를 생성
	 * 		ㄴ 사용자의 비밀번호를 임시비밀번호로 수정한 후 사용자가 회원가입시 입력해두었던 이메일로 임시비밀번호 전송
	 * 사용하는 Mapper : CustomerMapper.xml -> makeTemporaryPassword
	 * 참고사항 : 메일 전송시 d드라이브에 보내는 사람의 메일 주소와 메일비밀번호가 담긴 text파일이 필요("d:/abc.txt", 첫번째 줄에 메일 주소, 두번째 줄에 passowrd)
	 * 			ㄴ 소스 위치 : com.mycompany.util.SendMail.java
	 */
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
