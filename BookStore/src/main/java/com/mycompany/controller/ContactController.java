package com.mycompany.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.StoreVO;
import com.mycompany.service.StoreServiceImpl;

@Controller
public class ContactController {
	
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
		List<StoreVO> list = storeService.selectStore();
		StoreVO storeVO = new StoreVO();
//		for(int i=0; i<list.size(); i++) {
//			storeVO.setStoreId(list.get(i).getStoreId());
//			storeVO.setStoreAddr(list.get(i).getStoreAddr());
//			storeVO.setStoreName(list.get(i).getStoreName());
//			storeVO.setStorePoint(list.get(i).getStorePoint());
//		}
		mv.addObject("storeList", list);
		mv.addObject("storeListSize", list.size());
		mv.setViewName("/contact_map");
		return mv;
	}
}
