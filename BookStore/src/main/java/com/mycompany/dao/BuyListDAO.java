package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.BuyListVO;

public interface BuyListDAO {
	public int addBuyList(BuyListVO buyVO);
	public int getBuyListId(BuyListVO buyVO);
	public List<BuyListVO> getBuyListByCustomerId(String customerId);
}
