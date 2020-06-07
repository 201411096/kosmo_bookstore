package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BuyVO;

public interface BuyDAO {
	public int addBuy(BuyVO vo);
	public List<Map> selectAllBuyByBuyListId(int buylistId);
}
