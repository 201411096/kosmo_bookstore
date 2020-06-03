package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.BuyCartListVO;

public interface BuyCartListService {
	public int addCartList(BuyCartListVO vo);
	public BuyCartListVO checkDuplicateCartList(BuyCartListVO vo);
	public int cartListChangeCnt(BuyCartListVO vo);
	public List<BuyCartListVO> getCartList(BuyCartListVO vo);
	public int deleteCartList(BuyCartListVO vo);
	public int updateCartList(BuyCartListVO vo);
	public int clearCurrentCustomerCartList(BuyCartListVO vo);
}
