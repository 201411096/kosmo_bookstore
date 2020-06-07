package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.BuyListDAO;
import com.mycompany.dao.BuyListDAOImpl;
import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;

@Service("buyListService")
public class BuyListServiceImpl implements BuyListService{

	@Autowired
	BuyListDAOImpl buyListDAO;
	
	@Override
	public int addBuyList(BuyListVO buyVO) {
		return buyListDAO.addBuyList(buyVO);
	}

	@Override
	public int getBuyListId(BuyListVO buyVO) {
		return buyListDAO.getBuyListId(buyVO);		
	}

	@Override
	public List<BuyListVO> getBuyListByCustomerId(String customerId) {
		return buyListDAO.getBuyListByCustomerId(customerId);
	}	
}
