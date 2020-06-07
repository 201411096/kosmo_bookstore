package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BuyVO;

public interface BuyService {
	public int addBuy(BuyVO vo);
	public List<Map> selectAllBuyByBuyListId(int buylistId);
}
