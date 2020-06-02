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

import com.mycompany.domain.BookVO;
import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.BuyCartListServiceImpl;
import com.mycompany.service.TendencyServiceImpl;

@Controller
public class ProductController {

	@Autowired
	BookServiceImpl bookService;
	@Autowired
	BuyCartListServiceImpl buyCartListService;
	@Autowired
	TendencyServiceImpl tendencyService;

	@RequestMapping("/productView.do")
	public ModelAndView product(BookVO vo, HttpSession session) {
		// 제품번호 세팅
		ModelAndView mv = new ModelAndView();
		BookVO book = bookService.selectBook(vo);
		mv.addObject("priceBeforeDiscount", book.getBookSaleprice() + 3000);
		mv.addObject("info", book);

		// 로그인 상태라면
		if (session.getAttribute("customer") != null) {
			CustomerVO customer = (CustomerVO) session.getAttribute("customer");
			Map<String, String> tendencyMap = new HashMap<String, String>();
			tendencyMap.put("customerId", customer.getCustomerId());
			tendencyMap.put("genre", book.getBookGenre());
			tendencyService.increaseTendency(tendencyMap);
		}

		mv.setViewName("/productView");
		return mv;
	}

	// 검색 후 리스트 구성
	@RequestMapping("/productList.do")
	public ModelAndView bookList(@RequestParam(value = "searchWord") String searchWord) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> searchList = bookService.searchListBook(search);
		mv.addObject("searchList", searchList);
		mv.setViewName("/productList");
		return mv;
	}

	// 검색 창 리스트 구성
	@RequestMapping(value = "/searchList.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map searchList(@RequestParam(value = "searchWord") String searchWord) {
		// 검색어가 없다면 null값을 반환 -> 아래줄을 처리하지 않으면 모든 리스트를 다 가져오게됨
		if (searchWord == null || searchWord.equals(""))
			return null;
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> searchList = bookService.searchListBook(search);
		Map<String, Object> searchResult = new HashMap<String, Object>();
		searchResult.put("searchResult", searchList);
		return searchResult;
	}
	// 제품 메뉴창에서 장바구니를 갱신한 후에 모델로 넘김
	@RequestMapping("/addCartList.do")
	public ModelAndView addCartList(BuyCartListVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
		// 로그인 여부 판단
		if (logInState == null) {
			mv.setViewName("/login");
		} else {
			vo.setCustomerId(logInState.getCustomerId());
			// 장바구니 클릭 시 기존에 장바구니에 있는 상품인지 확인
			BuyCartListVO result = buyCartListService.checkDuplicateCartList(vo);
			if (result == null) {
				// 장바구니에 새로 추가
				buyCartListService.addCartList(vo);
			} else {
				// 장바구니 안 기존 상품의 개수 변경
				vo.setBuycartlistId(result.getBuycartlistId());
				buyCartListService.cartListChangeCnt(vo);
			}
			// cartList를 가져옴
			List<BuyCartListVO> list = buyCartListService.getCartList(vo);
			for (int i = 0; i < list.size(); i++) {
				int bookTotalPrice = list.get(i).getBuycartlistCnt() * list.get(i).getBookSaleprice();
				list.get(i).setBookTotalPrice(bookTotalPrice);
			}
			mv.addObject("cartList", list);
			mv.setViewName("/shopping-cart");
		}
		return mv;
	}
}