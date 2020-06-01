package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.BuyCartListDAOImpl;
import com.mycompany.domain.BuyCartListVO;

@Service("buyCartListService")
public class BuyCartListServiceImpl implements BuyCartListService{
	
	@Autowired
	private BuyCartListDAOImpl buycartlistDAO;
	
	@Override
	public int addCartList(BuyCartListVO vo) {
		return buycartlistDAO.addCartList(vo);
	}
	@Override
	public BuyCartListVO checkDuplicateCartList(BuyCartListVO vo) {
		return buycartlistDAO.checkDuplicateCartList(vo);
	}
	@Override
	public int cartListChangeCnt(BuyCartListVO vo) {
		return buycartlistDAO.cartListChangeCnt(vo);
	}
	
}
