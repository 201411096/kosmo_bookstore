package com.mycompany.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
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
import com.mycompany.service.CustomerServiceImpl;
import com.mycompany.service.TendencyServiceImpl;
import com.mycompany.util.CartList;

@Controller
public class ProductController {

	@Autowired
	BookServiceImpl bookService;
	@Autowired
	BuyCartListServiceImpl buyCartListService;
	@Autowired
	TendencyServiceImpl tendencyService;
	@Autowired
	CustomerServiceImpl customerService;

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
	@RequestMapping("/moveToCartList.do")
	public ModelAndView moveToCartList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
		int cartListTotalPrice = 0;
		// 로그인 여부 판단
		if (logInState == null) {
			mv.setViewName("/login");
		} else {
			BuyCartListVO vo = new BuyCartListVO();
			vo.setCustomerId(logInState.getCustomerId());
			// cartList를 가져옴
			List<BuyCartListVO> list = buyCartListService.getCartList(vo);
			for (int i = 0; i < list.size(); i++) {
				int bookTotalPrice = list.get(i).getBuycartlistCnt() * list.get(i).getBookSaleprice();
				cartListTotalPrice+=bookTotalPrice;
				list.get(i).setBookTotalPrice(bookTotalPrice);
			}
			mv.addObject("cartList", list);
			mv.addObject("cartListTotalPrice", cartListTotalPrice);
			mv.setViewName("/shopping-cart");

			// 세션에 저장되어 있는 장바구니 정보를 갱신함
			CartList.getInstance().setCartList(session, customerService);
		}
		return mv;
	}
	// 제품 메뉴창에서 장바구니를 갱신한 후에 모델로 넘김
	@RequestMapping("/addCartList.do")
	public ModelAndView addCartList(BuyCartListVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
		int cartListTotalPrice = 0;
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
				cartListTotalPrice+=bookTotalPrice;
				list.get(i).setBookTotalPrice(bookTotalPrice);
			}
			mv.addObject("cartList", list);
			mv.addObject("cartListTotalPrice", cartListTotalPrice);
			mv.setViewName("/shopping-cart");

			// 세션에 저장되어 있는 장바구니 정보를 갱신함
			CartList.getInstance().setCartList(session, customerService);
		}
		return mv;
	}
	@RequestMapping("/updateCartList.do")
	public ModelAndView updateCartList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//db에 있는 customer의 리스트값
		List<BuyCartListVO> list = CartList.getInstance().getBuyCartList(session, buyCartListService);
		Enumeration<String> e = request.getParameterNames();
		HashMap<String, String> map = new HashMap<String, String>(); //id와 bookcnt를 담을 hashmap
		int cartListTotalPrice = 0;
		
		while(e.hasMoreElements()) {
			String name = (String)e.nextElement();
			String values = request.getParameter(name);
			StringTokenizer st = new StringTokenizer(name, "_");
			map.put(st.nextToken(), values); //bookId와 cnt를 map에 넣음
		}
		for(int i=0; i<list.size(); i++) {
			map.containsKey(Integer.toString(list.get(i).getBookId()));
			if(map.containsKey(Integer.toString(list.get(i).getBookId()))==false || map.get(Integer.toString(list.get(i).getBookId())).equals("0")) { //해당 bookId가 없거나 개수가 0개라면 삭제된 것 혹은 삭제해야할 것임
				CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
				BuyCartListVO vo = new BuyCartListVO();
				vo.setCustomerId(logInState.getCustomerId());
				vo.setBookId(list.get(i).getBookId()); // 개수가 0이거나 db에는 있으나 사라진 bookId값
				buyCartListService.deleteCartList(vo);
			}else {
				CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
				BuyCartListVO vo = new BuyCartListVO();
				vo.setCustomerId(logInState.getCustomerId());
				vo.setBookId(list.get(i).getBookId());
				vo.setBuycartlistCnt(Integer.parseInt(map.get(Integer.toString(vo.getBookId()))));
				buyCartListService.updateCartList(vo);
			}
		}
		
		list = CartList.getInstance().getBuyCartList(session, buyCartListService); //수정된 리스트를 다시 가져옴
		for (int i = 0; i < list.size(); i++) {
			int bookTotalPrice = list.get(i).getBuycartlistCnt() * list.get(i).getBookSaleprice();
			cartListTotalPrice+=bookTotalPrice;
			list.get(i).setBookTotalPrice(bookTotalPrice);
		}
		//헤더의 장바구니 세션 갱신
		CartList.getInstance().setCartList(session, customerService);
		mv.addObject("cartList", list);
		mv.addObject("cartListTotalPrice", cartListTotalPrice);
		mv.setViewName("/shopping-cart");
		return mv;
	}	
}