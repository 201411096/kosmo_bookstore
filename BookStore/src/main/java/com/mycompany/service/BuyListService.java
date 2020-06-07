package com.mycompany.service;

import java.util.List;

import com.mycompany.dao.BuyListDAO;
import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;

public interface BuyListService {
	public int addBuyList(BuyListVO buyVO);
	public int getBuyListId(BuyListVO buyVO);
	public List<BuyListVO> getBuyListByCustomerId(String customerId);
}
