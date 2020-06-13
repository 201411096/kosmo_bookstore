package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
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

	/* 
	 * 함수 이름 : product
	 * 주요 기능 : productView화면 로딩
	 * 함수 내용 : 도서에 대한 정보, 해당 도서에 달린 리뷰, 관련 도서리스트, 로그인 상태라면 사용자의 선호 장르 점수를 높여줌
	 * 			ㄴ bookId에 해당하는 도서 정보를 넘겨줌 ("info")
	 * 			ㄴ 해당 도서와 관련된 제품들의 리스트를 4개까지 넘겨줌 ("relatedBookList")
	 * 			ㄴ 해당 도서에 해당하는 리뷰들을 불러옴 ("review")
	 * 			ㄴ 로그인 상태라면 해당 사용자의 현재 페이지의 도서 장르 부분 점수를 높여줌
	 * 사용한 Mapper : BookMapper.xml -> selectRelatedBook
	 * 				 BookMapper.xml -> selectBook
	 * 				 ReviewMapper.xml -> selectReview
	 * 참고사항 : mycompany.util.Tendency
	 * 				ㄴ increaseTendency : 로그인한 사용자의 선호 장르 점수에서 도서와 같은 부분에 해당하는 장르 점수를 증가시킴				 
	 */
	@RequestMapping("/productView.do")
	public ModelAndView product(BookVO vo, HttpSession session) {
		// 제품번호 세팅
		ModelAndView mv = new ModelAndView();
		BookVO book = bookService.selectBook(vo);
		//mv.addObject("priceBeforeDiscount", book.getBookSaleprice() + 3000); //사용하지 않음
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
	/* 
	 * 함수 이름 : bookList
	 * 주요 기능 : header 검색창에서 enter키를 쳤을 경우 도서 리스트 화면을 로딩
	 * 함수 내용 : header 검색창에서 입력한 searchWord(검색어)를 받아서 그에 해당하는 도서 리스트를 가져옴
	 * 			ㄴ 검색어와 일치하는 도서 이름, 저자 이름, 도서 장르에 해당하는 리스트들을 평점 순으로 반환  ("searchList")
	 * 			ㄴ 도서 리스트 화면 로딩
	 * 사용한 Mapper : BookMapper.xml -> searchList				 
	 */
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
	/* 
	 * 함수 이름 : searchList
	 * 주요 기능 : header 검색창에서 검색어를 입력시(keyupevent)  해당 도서 리스트를 비동기적으로 보냄
	 * 함수 내용 : header 검색창에서 입력한 searchWord(검색어)를 받아서 그에 해당하는 도서 리스트를 가져옴
	 * 			ㄴ 검색어와 일치하는 도서 이름, 저자 이름, 도서 장르에 해당하는 리스트들을 평점 순으로 반환  ("searchList")
	 * 			ㄴ header에 전달
	 * 			ㄴ 검색어가 없다면 아무것도 전달하지 않음
	 * 사용한 Mapper : BookMapper.xml -> searchList
	 * 반환하는 위치 : custom_header.js				 
	 */
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
	/* 
	 * 함수 이름 : moveToCartList
	 * 주요 기능 : 장바구니 화면으로 이동함
	 * 함수 내용 : 로그인이 되어있다면 사용자의 장바구니 화면을 로딩함
	 * 			ㄴ 세션에 저장되어있는 사용자 정보를 받아와서 장바구니를 검색해서 해당 목록들을 보냄("cartList")
	 * 			ㄴ 목록들의 총합을 계산해서 같이 보냄("cartListTotalPrice")
	 * 			ㄴ 장바구니의 목돌을 세션에 갱신
	 * 				ㄴ CartList.getInstance().setCartList
	 * 사용한 Mapper : BuyCartListMapper.xml -> getCartList
	 * 				 CustomerMapper.xml -> getCartList (내용이 위와 거의 동일)
	 * 참고사항 : mycompany.util.CartList			 
	 */	
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
	/* 
	 * 함수 이름 : addCartList
	 * 주요 기능 : 제품을 장바구니에 추가하며 장바구니 화면으로 넘어감
	 * 함수 내용 : 제품 메뉴창에서 장바구니 추가버튼을 누를 떄 호출
	 * 		ㄴ 세션에서 고객정보를 가져옴
	 * 		ㄴ 장바구니에 추가한 목록의 상품이 기존에 장바구니에 있던 상품인지 확인
	 * 			ㄴ 기존의 장바구니에 있던 상품이라면 장바구니에 새로 추가하고
	 * 			ㄴ 기존의 장바구니에 없던 상품이라면 기존의 목록에서 개수를 수정함
	 * 		ㄴ 앞의 작업에서 수정된 사용자의 장바구니 목록을 전부 가져와서 보냄 ("cartList")
	 * 		ㄴ 장바구니안의 도서 개수와 가격들을 뽑아서 장바구니 목록의 가격을 구해서 보냄 ("cartListTotalPrice")
	 * 사용한 Mapper : BuyCartListMapper.xml -> checkDuplicateCartList
	 * 				 BuyCartListMapper.xml -> addCartList
	 * 				 BuyCartListMapper.xml -> cartListChangeCnt
	 * 				 BuyCartListMapper.xml -> getCartList
	 * 				 CustomerMapper.xml -> getCartList (위의 getCartList와 거의 동일)
	 * 참고사항 : mycompany.util.CartList			 
	 */	
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
	/* 
	 * 함수 이름 : updateCartList
	 * 주요 기능 : 화면에서 수정한대로 장바구니를 수정함
	 * 함수 내용 : 화면에서 수정한대로 장바구니를 수정함(shopping-cart.jsp에서 updateCart 버튼을 눌렀을 경우 호출)
	 * 		ㄴ 현재 로그인 되어있는 사용자의 장바구니목록을 가져옴(수정되기전의 장바구니)
	 * 		ㄴ 화면에서 받아온 parameter들의 이름을 전부 받아옴 (getParameterNames()) => 받는 데이터는 bookId 와 구매개수만 받아옴
	 * 			ㄴ 받아온 이름의 크기만큼 반복하면서 bookId와 구매 개수를 하나씩 추출
	 * 		ㄴ db에 있는 장바구니 목록에는 있는데 화면에서 가져온 목록에는 없거나, 화면에서 가져온 목록에서 개수가 0개라면
	 * 			ㄴ 장바구니에서 삭제
	 * 		ㄴ db에 있는 장바구니 목록에도 있고 화면에서 가져온 목록에도 있다면(개수가 0개가 아니면서) 장바구니 업데이트
	 * 		ㄴ 수정이 끝난 장바구니 목록을 다시 가져와서 보내고 세션에서도 업데이트 시킴 ("cartList")
	 * 		ㄴ 장바구니 목록에 있는 도서 물품별로 개수와 가격을 계산해서 장바구니 목록 가격도 같이 보냄 ("cartListTotalPrice")
	 * 			  
	 * 사용한 Mapper : BuyCartListMapper.xml -> getCartList
	 * 				 BuyCartListMapper.xml -> updateCartList
	 * 				 BuyCartListMapper.xml -> deleteCartList
	 * 참고사항 : mycompany.util.CartList
	 * 			ㄴ updateCartList
	 * 				ㄴ getBuyCartList			 
	 */	
	@RequestMapping("/updateCartList.do")
	public ModelAndView updateCartList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 뷰에서 수정한대로 장바구니를 수정
		CartList.getInstance().updateCartList(request, session, buyCartListService, customerService, mv);
		mv.setViewName("/shopping-cart");
		return mv;
	}
	/* 
	 * 함수 이름 : sendList
	 * 주요 기능 : 장바구니 페이지에서 장바구니를 수정한대로 db를 수정한 후 db에 있는 장바구니값들을 그대로 가져옴
	 * 함수 내용 : 	장바구니 페이지에서 장바구니를 수정한대로 db를 수정한 후 db에 있는 장바구니값들을 그대로 가져옴 (장바구니에서 구매페이지 버튼을 누를 경우)
	 * 		ㄴ updateCartList에서 했던 작업을 그대로 하면서 구매 화면으로 넘어감
	 * 사용한 Mapper : BuyCartListMapper.xml -> getCartList
	 * 				 BuyCartListMapper.xml -> updateCartList
	 * 				 BuyCartListMapper.xml -> deleteCartList
	 * 참고사항 : mycompany.util.CartList
	 * 			ㄴ updateCartList
	 * 				ㄴ getBuyCartList			 
	 */	
	@RequestMapping("/sendList.do")
	public ModelAndView sendList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 뷰에서 수정한대로 장바구니를 수정
		CartList.getInstance().updateCartList(request, session, buyCartListService, customerService, mv);
		// db에 들어있는 장바구니에 있는 대로 구매 페이지로 이동함
		CartList.getInstance().goToBuyCartListWithoutUpdate(session, buyCartListService, mv);
		return mv;
	}
	/* 
	 * 함수 이름 : buyList
	 * 주요 기능 : sendList와 동일
	 * 함수 내용 : 	헤더모듈에서 바로 이동할 경우에 호출되는 것을 제외하고 sendList와 동일함			 
	 */	
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
	/* 
	 * 함수 이름 : addBuyList
	 * 주요 기능 : 구매화면(buy.jsp)에서 구매시 처리
	 * 함수 내용 : 	구매화면에서 구매시 장바구니를 비우고 영수증목록에 추가한 뒤 추가한 영수증 번호를 받는 구매목록들을 생성
	 * 		ㄴ 사용자 정보를 받아와서 구매 목록들을 하나로 묶어주는 영수증(buyListVO)를 db에 추가
	 * 		ㄴ 장바구니에 담겨있는 리스트들의 개수만큼 하나씩 위에서 생상한 영수증 id를 갖고있는 buyVO를 생성하고 db에 추가
	 * 		ㄴ 구매한 목록들의 장르에 해당하는 사용자의 선호 장르 점수를 증가시킴
	 * 		ㄴ 현재 사용자의 장바구니를 전부 비움
	 * 사용하는 Mapper : BuyListMapper.xml -> addBuyList
	 * 				  BuyMapper.xml -> addBuy
	 * 				  BookMapper.xml -> selectBook
	 * 				  TendencyMapper.xml -> increaseTendency
	 * 				  BuyCartListMapper.xml -> clearCurrentCustomerCartList
	 * 참고사항 : util.Tendency
	 * 		   util.CartList	 
	 */	
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