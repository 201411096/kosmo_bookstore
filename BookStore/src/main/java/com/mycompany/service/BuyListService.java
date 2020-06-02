package com.mycompany.service;

import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;

public interface BuyListService {
	public int addBuyList(BuyListVO buyVO);
	public int getBuyListId(BuyListVO buyVO);
}
