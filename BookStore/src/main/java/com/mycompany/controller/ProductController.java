package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mycompany.domain.ReviewVO;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.BuyCartListServiceImpl;
import com.mycompany.service.BuyListServiceImpl;
import com.mycompany.service.BuyServiceImpl;
import com.mycompany.service.CustomerServiceImpl;
import com.mycompany.service.ReviewServiceImpl;
import com.mycompany.service.TendencyServiceImpl;
import com.mycompany.util.CartList;
import com.mycompany.util.Tendency;

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
	@Autowired
	ReviewServiceImpl reviewService;

	@RequestMapping("/productView.do")
	public ModelAndView product(BookVO vo, HttpSession session) {
		// 제품번호 세팅
		ModelAndView mv = new ModelAndView();
		BookVO book = bookService.selectBook(vo);
		mv.addObject("priceBeforeDiscount", book.getBookSaleprice() + 3000);
		mv.addObject("info", book);
		// 관련 제품 세팅
		List<BookVO> relatedBookList = bookService.selectRelatedBook(book);
		mv.addObject("relatedBookList", relatedBookList);
		//bookVO에 들어잇는 bookId값에 해당하는 리뷰들을 가져와서 modelandview에 입력 부분 시작
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBookId(vo.getBookId());
		List<ReviewVO> reviewList= (List<ReviewVO>) reviewService.selectReview(reviewVO);
		mv.addObject("review", reviewList);
		//bookVO에 들어잇는 bookId값에 해당하는 리뷰들을 가져와서 modelandview에 입력 부분 끝
		
		// 로그인 상태라면 도서페이지의 장르에 해당하는 성향을 증가시켜줌
		if (session.getAttribute("customer") != null) {
			CustomerVO customer = (CustomerVO) session.getAttribute("customer");
			Tendency.getInstance().increaseTendency(session, tendencyService, customer, book, 1);
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
			//mv.setViewName("/login"); //redirect 사용 안한 버전
			mv.setViewName("redirect:/moveToLogin.do"); 
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
			mv.addObject("prevProduct", vo);
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
	// 장바구니 페이지에서 장바구니를 수정한대로 db를 수정한 후 db에 있는 장바구니값들을 그대로 가져옴 (장바구니에서 구매페이지로 이동할경우)
	@RequestMapping("/sendList.do")
	public ModelAndView sendList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 뷰에서 수정한대로 장바구니를 수정
		CartList.getInstance().updateCartList(request, session, buyCartListService, customerService, mv);
		// db에 들어있는 장바구니에 있는 대로 구매 페이지로 이동함
		CartList.getInstance().goToBuyCartListWithoutUpdate(session, buyCartListService, mv);
		return mv;
	}
	// db에 있는 장바구니값들을 그대로 가져옴(헤더모듈에서 구매페이지로 이동할 경우)
	@RequestMapping("/buyList.do")
	public ModelAndView buyList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("customer")==null) {
			mv.setViewName("redirect:/moveToLogin.do");
		}else {
			// db에 들어있는 장바구니에 있는 대로 구매 페이지로 이동함
			CartList.getInstance().goToBuyCartListWithoutUpdate(session, buyCartListService, mv);			
		}
		return mv;
	}
	// 구매하여 buylist에 추가(최종구매)
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
			
			//구매 도서 장르에 대한 성향을 증가시키는 부분
			BookVO temp = new BookVO(); // 도서 검색을 위한 임시 객체
			temp.setBookId(list.get(i).getBookId());
			BookVO bookVO = bookService.selectBook(temp);
			Tendency.getInstance().increaseTendency(session, tendencyService, logInState, bookVO, 2);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("customerInfo", logInState);
		mv.addObject("cartList", list);
//		mv.setViewName("/test_buy_check");
		mv.setViewName("redirect:/main.do");
		//현재 사용자의 장바구니를 비워주고 내부적으로 세션에 적용
		CartList.getInstance().clearCurrentCustomerCartList(session, buyCartListService, customerService);		
		return mv;
	}
	@RequestMapping(value = "/reloadCartlist.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map reloadCartlist(HttpSession session) {
		Map result = new HashMap();
		CustomerVO vo = (CustomerVO)session.getAttribute("customer");
		if(vo!=null) {
			List<BuyCartListVO> cartList = customerService.getCartList(vo.getCustomerId());
			int cartListTotalPrice = 0;
			for(int i=0; i<cartList.size(); i++) {
				cartListTotalPrice += cartList.get(i).getBookTotalPrice();
			}
			result.put("cartList", cartList);
			result.put("cartListSize", cartList.size());
			result.put("cartListTotalPrice", cartListTotalPrice);
		}
		return result;
	}
	
	// 베스트셀러 더 보기 클릭 후 리스트 구성
    @RequestMapping("/bestSellerProductList.do")
    public ModelAndView showBestSellerProductList() {
       ModelAndView mv = new ModelAndView();
       List<BookVO> bestSellerList = bookService.selectBestSeller();
       mv.addObject("searchList", bestSellerList);
       mv.setViewName("/productList");
       return mv;
    }
}