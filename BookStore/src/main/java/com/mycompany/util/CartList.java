package com.mycompany.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.service.BuyCartListServiceImpl;
import com.mycompany.service.CustomerServiceImpl;

public class CartList {
	private static CartList cartList = null;
	private CartList() {}
	public static CartList getInstance() {
		if(cartList==null) {
			cartList = new CartList();
		}
		return cartList;
	}
	//장바구니를 세션에 넣어주는 함수
	public void setCartList(HttpSession session, CustomerServiceImpl customerService) {
		CustomerVO vo = (CustomerVO)session.getAttribute("customer");
		List<BuyCartListVO> cartList = customerService.getCartList(vo.getCustomerId());
		int cartListTotalPrice = 0;
		for(int i=0; i<cartList.size(); i++) {
			cartListTotalPrice += cartList.get(i).getBookTotalPrice();
		}
		//장바구니의 총합을 세팅
		session.setAttribute("cartListTotalPrice", cartListTotalPrice);
		//장바구니 개수를 가져와서 세팅						
		session.setAttribute("cartListNumber", cartList.size());
		//장바구니 목록 세팅
		session.setAttribute("cartList", cartList);
	}
	//리스트를 db에서 끌어오는 함수(세션에 들어가있는 customer정보를 가져옴)
	public List<BuyCartListVO> getBuyCartList(HttpSession session, BuyCartListServiceImpl buyCartListService){
		CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
		BuyCartListVO vo = new BuyCartListVO();
		vo.setCustomerId(logInState.getCustomerId());
		List<BuyCartListVO> list = buyCartListService.getCartList(vo);
		
		return list;
	}
	//장바구니 변경 없이 바로 구매페이지로 이동
	public void goToBuyCartListWithoutUpdate(HttpSession session, BuyCartListServiceImpl buyCartListService, ModelAndView mv) {
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
	}	
	//장바구니를 업데이트 해주는 함수 (update페이지의 updatecart와 sendlist.do 앞푸분에서 사용할 함수)
	public void updateCartList(HttpServletRequest request, HttpSession session, BuyCartListServiceImpl buyCartListService, CustomerServiceImpl customerService, ModelAndView mv) {
		//db에 있는 customer의 리스트값을 가져옴
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
	}
	//현재 사용자의 장바구니를 비워줌
	public void clearCurrentCustomerCartList(HttpSession session, BuyCartListServiceImpl buyCartListService, CustomerServiceImpl customerService) {
		CustomerVO logInState = (CustomerVO) session.getAttribute("customer");
		BuyCartListVO vo = new BuyCartListVO();
		vo.setCustomerId(logInState.getCustomerId());
		buyCartListService.clearCurrentCustomerCartList(vo);
		//장바구니를 세션에 넣어주는 함수(초기화한 장바구니를 세션에 적용)
		CartList.getInstance().setCartList(session, customerService);
	}
}
