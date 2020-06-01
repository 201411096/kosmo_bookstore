package com.mycompany.dao;

import com.mycompany.domain.BuyCartListVO;

public interface BuyCartListDAO {
	public int addCartList(BuyCartListVO vo);
	public BuyCartListVO checkDuplicateCartList(BuyCartListVO vo);
	public int cartListChangeCnt(BuyCartListVO vo);
}
