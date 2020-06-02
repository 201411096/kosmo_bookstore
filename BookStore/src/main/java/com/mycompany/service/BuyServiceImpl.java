package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.BuyDAOImpl;
import com.mycompany.domain.BuyVO;

@Service("buyService")
public class BuyServiceImpl implements BuyService{
	
	@Autowired
	BuyDAOImpl buyDAO;
	
	@Override
	public int addBuy(BuyVO vo) {
		return buyDAO.addBuy(vo);
	}

}
