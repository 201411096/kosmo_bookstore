package com.mycompany.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;

@Repository("buyListDAO")
public class BuyListDAOImpl implements BuyListDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int addBuyList(BuyListVO buyVO) {
		return mybatis.insert("BuyListDAO.addBuyList", buyVO);
	}

	@Override
	public int getBuyListId(BuyListVO buyVO) {
		return mybatis.selectOne("BuyListDAO.getBuyListId", buyVO);
		
	}
}
