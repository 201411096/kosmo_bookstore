package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.StoreVO;
import com.mycompany.service.StoreServiceImpl;

@Controller
public class StoreController {

	@Autowired
	StoreServiceImpl storeService;
	
	@RequestMapping("/admin/store.do")
	public ModelAndView loadAdminStore() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_store");
		return mv;
	}
	
	//출력
	@RequestMapping(value="/admin/getStoreData.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getStoreData(HttpSession session, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();
		List<StoreVO> storeList = storeService.selectStoreSearchByName(searchWord);
		
		result.put("storeList", storeList);
		result.put("storeListSize", storeList.size());
		return result;
	}
	
	//입력로드
	@RequestMapping(value="/admin/loadInsertStore.do")
	public ModelAndView storeInsertPage(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_storeInsert");
		return mv;
	}
	
	//입력
	@RequestMapping(value="/admin/insertStore.do")
	public ModelAndView storeUpdatePage(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		storeService.insertStore(storevo);
		mv.setViewName("/admin/admin_store");
		return mv;
	}
	
	//수정로드
	@RequestMapping(value="/admin/loadStoreUpdatePage.do")
	public ModelAndView loadStoreUpdatePage(HttpSession session, int storeId) {
		ModelAndView mv = new ModelAndView();
		StoreVO storevo = new StoreVO();
		storevo.setStoreId(storeId);
		storevo = (StoreVO)storeService.selectStoreByStoreId(storevo);
		mv.addObject("storevo", storevo);
		mv.setViewName("/admin/admin_storeUpdate");
		return mv;
	}
	//수정
	@RequestMapping(value="/admin/storeUpdatePage.do")
	public ModelAndView StoreUpdatePage(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		storeService.updateStore(storevo);
		mv.setViewName("/admin/admin_store");
		return mv;
	}
	
	//삭제
	@RequestMapping(value="/admin/storeDelete.do")
	public ModelAndView storeDelete(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		storeService.deleteStore(storevo);
		mv.setViewName("/admin/admin_store");
		return mv;
	}
}
