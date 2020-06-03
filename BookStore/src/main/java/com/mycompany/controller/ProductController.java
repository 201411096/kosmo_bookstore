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
import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.BuyVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.BuyCartListServiceImpl;
import com.mycompany.service.BuyListServiceImpl;
import com.mycompany.service.BuyServiceImpl;
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

	@Autowired
	BuyListServiceImpl buyListService;

	@Autowired
	BuyServiceImpl buyService;

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
				cartListTotalPrice += bookTotalPrice;
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
				cartListTotalPrice += bookTotalPrice;
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
		// 뷰에서 수정한대로 장바구니를 수정
		CartList.getInstance().updateCartList(request, session, buyCartListService, customerService, mv);
		mv.setViewName("/shopping-cart");
		return mv;
	}
	
	// 장바구니에 있는 상품을 addList로 추가함
	@RequestMapping("/sendList.do")
	public ModelAndView sendList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 뷰에서 수정한대로 장바구니를 수정
		CartList.getInstance().updateCartList(request, session, buyCartListService, customerService, mv);
		// session에서 customerId 추출 및 로그인 상태 확인
		CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
		BuyCartListVO vo = new BuyCartListVO();
		vo.setCustomerId(logInState.getCustomerId());
		if (logInState == null)
			mv.setViewName("/login");
		else {
			List<BuyCartListVO> list = buyCartListService.getCartList(vo);
			int subTotal = 0;
			for (int i = 0; i < list.size(); i++) {
				int bookTotalPrice = list.get(i).getBuycartlistCnt() * list.get(i).getBookSaleprice();
				list.get(i).setBookTotalPrice(bookTotalPrice);
				subTotal = subTotal + list.get(i).getBookTotalPrice();
			}
			mv.addObject("customerInfo", logInState);
			mv.addObject("subTotal", subTotal);
			mv.addObject("cartList", list);
			mv.setViewName("/buy");
		}
		return mv;
	}
	//헤더모듈에서 바로 구매하러 갈 경우
	@RequestMapping("/buyList.do")
	public ModelAndView buyList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// db에 들어있는 장바구니에 있는 대로 구매 페이지로 이동함
		CartList.getInstance().goToBuyCartListWithoutUpdate(session, buyCartListService, mv);
		return mv;
	}

	// 구매하여 buylist에 추가
	@RequestMapping("/addBuyList.do")
	public ModelAndView addBuyList(BuyListVO buyListVO, HttpSession session) {
		// BuyListVO의 buylistShippingadderess: 배송지(주소+상세주소)에 초기화
		buyListVO.setBuylistShippingadderess(buyListVO.getAddr() + buyListVO.getDetailAddr());
		// BuyListVO의 CustomerId에 초기화
		CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
		buyListVO.setCustomerId(logInState.getCustomerId());
		// DB에 buyList 추가
		buyListService.addBuyList(buyListVO);
		// BuyVO의 BuylistId에 초기화
		BuyVO buyVO = new BuyVO();
		buyVO.setBuylistId(buyListService.getBuyListId(buyListVO));
		// BuyList의 각각의 리스트를 BuyVO 파라미터에 넣기
		BuyCartListVO buyCartListVo = new BuyCartListVO();
		buyCartListVo.setCustomerId(logInState.getCustomerId());
		List<BuyCartListVO> list = buyCartListService.getCartList(buyCartListVo);
		for (int i = 0; i < list.size(); i++) {
			buyVO.setBuyCnt(list.get(i).getBuycartlistCnt());
			buyVO.setBookId(list.get(i).getBookId());
			// DB에 각각의 buy 추가
			buyService.addBuy(buyVO);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("customerInfo", logInState);
		mv.addObject("cartList", list);
		mv.setViewName("/test_buy_check");
		return mv;
	}
}