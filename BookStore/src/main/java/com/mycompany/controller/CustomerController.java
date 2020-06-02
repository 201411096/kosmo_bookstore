
package com.mycompany.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.CustomerVO;
import com.mycompany.service.CustomerServiceImpl;
import com.mycompany.service.TendencyServiceImpl;
import com.mycompany.util.CartList;


	//Handles requests for the application home page.
 
@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	@Autowired
	CustomerServiceImpl customerService;
	@Autowired
	TendencyServiceImpl tendencyService;
	
	@RequestMapping("/moveToLogin.do")
	public ModelAndView moveToLogin(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login");
		return mv;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(CustomerVO vo, HttpSession session) {
		//로그인 입력값으로 확인
		CustomerVO result = customerService.selectCustomer(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/test_login_check");
		
		if(result==null) {}
		else {
			//고객 정보를 세팅
			session.setAttribute("customer", result);
			//장바구니 목록 갱신
			CartList.getInstance().setCartList(session, customerService);
		}
		return mv;
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("LoginController에서 logout.do 실행 확인");
		session.invalidate();
		
		mv.setViewName("/test_logout_check");
		
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
}
