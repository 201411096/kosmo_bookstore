package com.mycompany.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.CustomerVO;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@RequestMapping("/admin/dashboard.do")
	public ModelAndView moveToAdminDashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		if(customerVO ==null || customerVO.getCustomerFlag()==1)
		{
			mv.setViewName("redirect:/moveToLogin.do");
			return mv;
		}
		mv.setViewName("/admin/dashboard");
		return mv;
	}
	@RequestMapping("/admin/leftSidebar.do")
	public ModelAndView loadLeftSidebar() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/leftSidebar");
		return mv;
	}
	@RequestMapping("/admin/topbar.do")
	public ModelAndView loadTopbar() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/topbar");
		return mv;
	}
	@RequestMapping("/admin/writer.do")
	public ModelAndView loadAdminWriter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writer");
		return mv;
	}
}
