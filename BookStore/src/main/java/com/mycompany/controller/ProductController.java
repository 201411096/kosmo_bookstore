package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BookVO;
import com.mycompany.service.BookServiceImpl;

@Controller
public class ProductController {

	@Autowired
	BookServiceImpl BookService;

	@RequestMapping("/productView.do")
	public ModelAndView product(BookVO vo) {
		//제품번호 세팅
		//vo.setBookId(3);
		ModelAndView mv = new ModelAndView();
		BookVO info = BookService.selectBook(vo);
		mv.addObject("priceBeforeDiscount", info.getBookSaleprice() + 3000);
		mv.addObject("info", info);
		mv.setViewName("/productView");
		return mv;
	}
	
	@RequestMapping(value="/searchList.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map searchList(@RequestParam(value="searchWord") String searchWord){
		//검색어가 없다면 null값을 반환 -> 아래줄을 처리하지 않으면 모든 리스트를 다 가져오게됨
		if(searchWord == null || searchWord.equals(""))
			return null;
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> searchList = BookService.searchListBook(search);
		Map<String, Object> searchResult = new HashMap<String, Object>();
		searchResult.put("checkAjax", "checkAjax11");
		searchResult.put("searchResult", searchList);
		return searchResult;
	}
}