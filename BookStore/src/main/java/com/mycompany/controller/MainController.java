package com.mycompany.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


	//Handles requests for the application home page.
 
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/{step}.do") // {step}은 
	public String viewPage(@PathVariable String step) { // step이라는 변수값이 위에 RequestMapping안에 들어감
	      return step;
	}
	
	@RequestMapping("/header.do")
	public ModelAndView loadHeader() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/header");
		return mv;
	}
	
	@RequestMapping("/footer.do")
	public ModelAndView loadFooter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/footer");
		return mv;
	}
}
