package com.mycompany.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BuyListController {
	
//	@RequestMapping("/moveToReceiptList")
//	public ModelAndView moveToReceiptList(HttpSession session) {
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("/receiptList");
//		return mv;
//	}
	
	@ResponseBody
	@RequestMapping(value = "/getReceiptList",  produces = "application/json; charset=utf-8")
	public Map getReceiptList() {
		Map result = new HashMap();
		
		return result;
	}
}
