package com.mycompany.service;

import com.mycompany.domain.BuyCartListVO;

public interface BuyCartListService {
	public int addCartList(BuyCartListVO vo);
	public BuyCartListVO checkDuplicateCartList(BuyCartListVO vo);
	public int cartListChangeCnt(BuyCartListVO vo);
	
}
