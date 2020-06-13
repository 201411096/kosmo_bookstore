package com.mycompany.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BookVO;
import com.mycompany.service.BookServiceImpl;


	//Handles requests for the application home page.
 
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	BookServiceImpl bookService;
	
	
	/* 
	 * 함수 이름 : viewPage
	 * 주요 기능 : mapping에 해당하는 페이지로 이동
	 * 함수 내용 : --
	 */
	@RequestMapping("/{step}.do") // {step}은 
	public String viewPage(@PathVariable String step) { // step이라는 변수값이 위에 RequestMapping안에 들어감
	      return step;
	}
	/* 
	 * 함수 이름 : loadHeader
	 * 주요 기능 : 헤더 로딩
	 * 함수 내용 : --
	 */	
	@RequestMapping("/header.do")
	public ModelAndView loadHeader() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/header");
		return mv;
	}
	/* 
	 * 함수 이름 : footer
	 * 주요 기능 : footer 로딩
	 * 함수 내용 : --
	 */		
	@RequestMapping("/footer.do")
	public ModelAndView loadFooter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/footer");
		return mv;
	}
	/* 
	 * 함수 이름 : selectBannerBook
	 * 주요 기능 : 메인화면 로딩
	 * 함수 내용 : 최근에 출간된 책들과 구매권수가 많은 책들을 가져와서 메인화면 로딩
	 * 사용하는 Mapper : BookMapper.xml -> selectBannerBook
	 * 					ㄴ 최근에 출간된 순서대로 6개까지 책들을 가져옴
	 * 				  BookMapper.xml -> selectBestSeller
	 * 					ㄴ 구매권수가 많은 순서대로 6개까지 책들을 가져옴
	 */		
	@RequestMapping("/main.do")
	public ModelAndView selectBannerBook() {
		ModelAndView mv = new ModelAndView();
		// 배너 책 select
		List<BookVO> bannerlist = bookService.selectBannerBook();
		mv.addObject("bannerBookList", bannerlist);
		// 베스트 셀러 책 select
		List<BookVO> bestSellerList = bookService.selectBestSeller();
		mv.addObject("bestSellerList", bestSellerList);
		return mv;
	}
}
