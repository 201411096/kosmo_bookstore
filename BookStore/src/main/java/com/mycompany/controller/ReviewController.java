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

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.ReviewServiceImpl;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	@Autowired
	ReviewServiceImpl reviewService;
	@Autowired
	BookServiceImpl bookService;

	// 리뷰 입력 (***리뷰조건 필요)
	@RequestMapping("/productReview.do")
	public ModelAndView reviewInsert(ReviewVO vo, BookVO bookVO, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO customer = (CustomerVO) session.getAttribute("customer");
		vo.setCustomerId(customer.getCustomerId());
		int result = reviewService.insertReview(vo);
		if (result == 0) {
			mv.setViewName("/login");
		}

		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBookId(vo.getBookId());

		List<ReviewVO> reviewList = (List<ReviewVO>) reviewService.selectReview(reviewVO);
		mv.addObject("review", reviewList);
		mv.setViewName("/productView");

		BookVO book = bookService.selectBook(bookVO);
		mv.addObject("priceBeforeDiscount", book.getBookSaleprice() + 3000);
		mv.addObject("info", book);

		return mv;
	}

	// ajax 리뷰입력
	@RequestMapping(value = "/insertReview.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map insertReview(HttpSession session, @RequestParam(value = "bookId") int bookId,
			@RequestParam(value = "buyreviewScore") int buyreviewScore,
			@RequestParam(value = "buyreviewContent") String buyreviewContent) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO) session.getAttribute("customer");
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBookId(bookId);
		reviewVO.setBuyreviewContent(buyreviewContent);
		reviewVO.setBuyreviewScore(buyreviewScore);
		reviewVO.setCustomerId(customerVO.getCustomerId());

		// 사용자가 해당 책에 리뷰를 단 적이 없다면
		if (reviewService.selectReviewByCustomerId(reviewVO) == null) {
			reviewService.insertReview(reviewVO);
			bookService.updateBookScore(reviewVO); // 책의 평점을 변경함

			List<ReviewVO> reviewList = (List<ReviewVO>) reviewService.selectReview(reviewVO);
			result.put("reviewList", reviewList);
			result.put("reviewListSize", reviewList.size());
			result.put("insertResult", "1"); // 리뷰 삽입 성공
		} else {
			result.put("insertResult", "0"); // 리뷰 삽입 실패
		}

		return result;
	}

	// ajax 리뷰수정
	@RequestMapping(value = "/updateReview.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map updateReview(HttpSession session, @RequestParam(value = "bookId") int bookId,
			@RequestParam(value = "buyreviewScore") int buyreviewScore,
			@RequestParam(value = "buyreviewContent") String buyreviewContent) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO) session.getAttribute("customer");
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBookId(bookId);
		reviewVO.setCustomerId(customerVO.getCustomerId());
		// 이전 평점 정보를 책에서 삭제함
		ReviewVO reviewVOForUpdateBookScore = reviewService.selectReviewByCustomerId(reviewVO);
		bookService.updateBookSocreByDeletePrevRecord(reviewVOForUpdateBookScore);
		
		reviewVO.setBuyreviewContent(buyreviewContent);
		reviewVO.setBuyreviewScore(buyreviewScore);
		

		int updateResult = reviewService.updateReview(reviewVO);
		//새로운 평점 정보를 책에 반영함
		bookService.updateBookScore(reviewVO);
		// update가 잘 됬을 경우
		if (updateResult == 1) {
			List<ReviewVO> reviewList = (List<ReviewVO>) reviewService.selectReview(reviewVO);
			result.put("reviewList", reviewList);
			result.put("reviewListSize", reviewList.size());
			result.put("updateResult", "1"); // 리뷰 수정 성공
		} else {
			result.put("updateResult", "0"); // 리뷰 수정 실패
		}

		return result;
	}

	@RequestMapping(value = "/deleteReview.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map deleteReview(HttpSession session, @RequestParam(value = "reviewId") String reviewId,
			@RequestParam(value = "customerId") String customerId) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO) session.getAttribute("customer");
		ReviewVO reviewVO = reviewService.selectReviewByReviewId(Integer.parseInt(reviewId));

		// 리뷰를 작성한 작성자와 현재 로그인한 사용자가 같을경우에 삭제
		if (customerId.equals(customerVO.getCustomerId())) {
			reviewService.deleteReview(reviewVO);
			bookService.updateBookSocreByDeletePrevRecord(reviewVO);
			List<ReviewVO> reviewList = (List<ReviewVO>) reviewService.selectReview(reviewVO);
			result.put("reviewList", reviewList);
			result.put("reviewListSize", reviewList.size());
			result.put("deleteResult", "1"); // 리뷰 수정 성공
		} else {
			result.put("deleteResult", "0"); // 리뷰 수정 성공
		}
		return result;
	}
}
