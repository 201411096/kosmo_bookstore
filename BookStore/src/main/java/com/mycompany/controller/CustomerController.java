
package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.service.CustomerServiceImpl;


	//Handles requests for the application home page.
 
@Controller
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	@Autowired
	CustomerServiceImpl customerService;
	
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
		
		if(result==null)
			System.out.println("LoginController에서 확인 ==> 회원정보가 존재하지 않습니다.");
		else {
			System.out.println("LoginController에서 확인 ==> 로그인에 성공했습니다.");
			
			//장바구니 개수를 가져와서 세팅			
			int cartListNumber = customerService.getCartListNumber(result.getCustomerId());
			session.setAttribute("cartListNumber", cartListNumber);
			//장바구니 안 물품의 가격 합을 가져와서 세팅
			int cartListTotalPrice = customerService.getCartListTotalPrice(result.getCustomerId());
			session.setAttribute("cartListTotalPrice", cartListTotalPrice);
			//장바구니 목록을 가져옴
			List<BuyCartListVO> cartList = customerService.getCartList(result.getCustomerId());
			session.setAttribute("cartList", cartList);			
			session.setAttribute("customer", result);
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
	//가입
	@RequestMapping("/customerRegister.do")
	public String getjoin(CustomerVO vo, HttpSession session) {
		int result = customerService.insertCustomer(vo);
		//회원가입 성공 시 로그인을 바로 해줌
		if(result==1) {
			session.setAttribute("customer", vo);
		}
		return "redirect:/registerCon.do";
	}
	
	//가입 확인(정보 불러오기)
	@RequestMapping("/registerCon.do")
	public String joinCon(CustomerVO vo, Model model) {
//		model.addAttribute("customer", customerService.selectCustomer(vo));
		return "registerCon";
	}
	
}
