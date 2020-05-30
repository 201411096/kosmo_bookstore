package com.mycompany.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
//	@RequestMapping(value="/searchList.do", produces="application/text; charset=utf-8")
//	@ResponseBody
//	public List<BookVO> searchList(String searchWord){
//		
//	}
}