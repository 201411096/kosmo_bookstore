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
	
	@RequestMapping(value="/searchList.do", produces="application/text; charset=utf-8")
	@ResponseBody
	public List<BookVO> searchList(@RequestParam(value="searchWord") String searchWord){
		System.out.println("productController의 searchList()에서 searchWord 확인 ==>" + searchWord);
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> list = BookService.searchListBook(search);
		
		System.out.println("productController의 searchList()에서 list 사이즈 확인 ==>" + list.size());
		return list;
	}
}