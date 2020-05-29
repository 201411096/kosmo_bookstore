package com.mycompany.controller;
/*
package com.mycompany.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


	//Handles requests for the application home page.
 
@Controller
public class TestControllerKys {
	
	private static final Logger logger = LoggerFactory.getLogger(TestControllerKys.class);
	
	
	//Simply selects the home view to render by returning its name.
	 
//	@RequestMapping("/{step}.do") // {step}은 
//	public String viewPage(@PathVariable String step) { // step이라는 변수값이 위에 RequestMapping안에 들어감
//	      return step;
//	}
	
	@RequestMapping("/header.do")
	public ModelAndView loadHeader() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/header");
		return mv;
	}
	
	@RequestMapping("/moveToLogin.do")
	public ModelAndView moveToLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login");
		return mv;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login() {
		System.out.println("TestControllerkys에서 login.do 확인");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/test_login_check");
		return mv;
	}
	
}
*/
