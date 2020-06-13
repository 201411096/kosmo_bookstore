package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	@Autowired
	StoreServiceImpl storeService;
	
	@RequestMapping("/admin/store.do")
	public ModelAndView loadAdminStore() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_store");
		return mv;
	}
	/* 
	 * 함수 이름 : getStoreData
	 * 주요 기능 : 지점의 정보를 가져옴
	 * 함수 내용 : --
	 * 반환 위치 : admin_writer.js				 
	 */
	@RequestMapping(value="/admin/getStoreData.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getStoreData(HttpSession session, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();
		List<StoreVO> storeList = storeService.selectStoreSearchByName(searchWord);
		
		result.put("storeList", storeList);
		result.put("storeListSize", storeList.size());
		return result;
	}
	
	/* 
	 * 함수 이름 : storeInsertPage
	 * 주요 기능 : 지점 입력창을 불러옴
	 * 함수 내용 : --				 
	 */
	@RequestMapping(value="/admin/loadInsertStore.do")
	public ModelAndView storeInsertPage(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_storeInsert");
		return mv;
	}
	
	/* 
	 * 함수 이름 : storeUpdatePage (이름이..?)
	 * 주요 기능 : 지점 입력
	 * 함수 내용 : --				 
	 */
	@RequestMapping(value="/admin/insertStore.do")
	public ModelAndView storeUpdatePage(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		storeService.insertStore(storevo);
		mv.setViewName("/admin/admin_store");
		return mv;
	}
	
	/* 
	 * 함수 이름 : loadStoreUpdatePage
	 * 주요 기능 : 지점 수정 페이지를 불러옴
	 * 함수 내용 : 지점 관리 페이지(admin_store.jsp)에서 클릭한 해당 지점의 정보를 불러옴				 
	 */
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
	/* 
	 * 함수 이름 : StoreUpdatePage
	 * 주요 기능 : 지점 정보 수정
	 * 함수 내용 : --				 
	 */
	@RequestMapping(value="/admin/storeUpdatePage.do")
	public ModelAndView StoreUpdatePage(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		storeService.updateStore(storevo);
		mv.setViewName("/admin/admin_store");
		return mv;
	}
	
	/* 
	 * 함수 이름 : storeDelete
	 * 주요 기능 : 지점 삭제
	 * 함수 내용 : --				 
	 */
	@RequestMapping(value="/admin/storeDelete.do")
	public ModelAndView storeDelete(HttpSession session, StoreVO storevo) {
		ModelAndView mv = new ModelAndView();
		storeService.deleteStore(storevo);
		mv.setViewName("/admin/admin_store");
		return mv;
	}
}
