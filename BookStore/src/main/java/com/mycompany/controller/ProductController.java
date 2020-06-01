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

@Controller
public class ProductController {

	@Autowired
	BookServiceImpl bookService;
	
	@Autowired
	BuyCartListServiceImpl buyCartListService;

	@RequestMapping("/productView.do")
	public ModelAndView product(BookVO vo) {
		//제품번호 세팅
		//vo.setBookId(3);
		ModelAndView mv = new ModelAndView();
		BookVO info = bookService.selectBook(vo);
		mv.addObject("priceBeforeDiscount", info.getBookSaleprice() + 3000);
		mv.addObject("info", info);
		mv.setViewName("/productView");
		return mv;
	}
	//검색 후 리스트 구성
	@RequestMapping("/productList.do")
	public ModelAndView bookList(@RequestParam(value="searchWord") String searchWord) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> searchList = bookService.searchListBook(search);
		mv.addObject("searchList", searchList);
		mv.setViewName("/productList");
		return mv;
	}
	//검색 창 리스트 구성
	@RequestMapping(value="/searchList.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map searchList(@RequestParam(value="searchWord") String searchWord){
		//검색어가 없다면 null값을 반환 -> 아래줄을 처리하지 않으면 모든 리스트를 다 가져오게됨
		if(searchWord == null || searchWord.equals(""))
			return null;
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> searchList = bookService.searchListBook(search);
		Map<String, Object> searchResult = new HashMap<String, Object>();
		searchResult.put("checkAjax", "checkAjax11");
		searchResult.put("searchResult", searchList);
		return searchResult;
	}
	//장바구니에 추가
	   @RequestMapping("/addCartList.do")
	   public ModelAndView addCartList(BuyCartListVO vo, HttpSession session) {
		   ModelAndView mv = new ModelAndView();
		   CustomerVO logInState = (CustomerVO)session.getAttribute("customer");
		   // 로그인 여부 판단
		   if(logInState==null) {
			   mv.setViewName("/login"); 
		   }else {
			   String customerId = logInState.getCustomerId();
			   vo.setCustomerId(customerId);
			   // 장바구니 추가 시 기존 장바구니에 있다면 개수를 변경하도록 하는 기능
			   BuyCartListVO result = buyCartListService.checkDuplicateCartList(vo);
			   
			   if(result==null) {
				   // 장바구니에 새로 추가
				   int result2 = buyCartListService.addCartList(vo);
				   mv.setViewName("/shopping-cart");
			   }else {
				   // 장바구니 안 기존 상품의 개수 변경
				   int buycartlistId = result.getBuycartlistId();
				   vo.setBuycartlistId(buycartlistId);
				   int result3 = buyCartListService.cartListChangeCnt(vo);
				   mv.setViewName("/shopping-cart");
			   }
		   }
		   return mv;
	   }
}