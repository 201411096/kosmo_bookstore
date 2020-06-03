package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.ReviewServiceImpl;

@Controller
public class ReviewController {	
	@Autowired
	ReviewServiceImpl reviewService;	
	@Autowired
	BookServiceImpl bookService;
	//리뷰 입력 (***리뷰조건 필요)
	@RequestMapping("/productReview.do")
	public ModelAndView reviewInsert(ReviewVO vo, BookVO bookVO, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO customer = (CustomerVO)session.getAttribute("customer");
		vo.setCustomerId(customer.getCustomerId());
		int result = reviewService.insertReview(vo);
		if(result==0) {
			mv.setViewName("/login");
		}
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBookId(vo.getBookId());
		
		List<ReviewVO> reviewList= (List<ReviewVO>) reviewService.selectReview(reviewVO);
		mv.addObject("review", reviewList);
		mv.setViewName("/productView");
		
		BookVO book = bookService.selectBook(bookVO);
		mv.addObject("priceBeforeDiscount", book.getBookSaleprice() + 3000);
		mv.addObject("info", book);
		
		return mv;
	}	
}
