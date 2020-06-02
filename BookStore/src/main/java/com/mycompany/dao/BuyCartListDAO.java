package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.BuyCartListVO;

public interface BuyCartListDAO {
	public int addCartList(BuyCartListVO vo);
	public BuyCartListVO checkDuplicateCartList(BuyCartListVO vo);
	public int cartListChangeCnt(BuyCartListVO vo);
	public List<BuyCartListVO> getCartList(BuyCartListVO vo);
	public int deleteCartList(BuyCartListVO vo);
	public int updateCartList(BuyCartListVO vo);
}
