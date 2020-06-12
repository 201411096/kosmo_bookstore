package com.mycompany.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.StoreVO;
import com.mycompany.service.StoreServiceImpl;

@Controller
public class ContactController {
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);
	@Autowired
	StoreServiceImpl storeService;
	@RequestMapping("/contact.do")
	public ModelAndView selectStore() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/contact");
		return mv;
	}
	@RequestMapping("/contact_map.do")
	public ModelAndView contactMap() {
		ModelAndView mv = new ModelAndView();
		//List<StoreVO> list = storeService.selectStore();
		List<StoreVO> list = storeService.selectStoreSearchByName("");
		StoreVO storeVO = new StoreVO();
		
		mv.addObject("storeList", list);
		mv.addObject("storeListSize", list.size());
		mv.setViewName("/contact_map");
		return mv;
	}
}
