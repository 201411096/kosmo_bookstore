package com.mycompany.dao;

import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;

public interface BuyListDAO {
	public int addBuyList(BuyListVO buyVO);
	public int getBuyListId(BuyListVO buyVO);
}
