package com.mycompany.util;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;
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
}
