package com.mycompany.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BuyVO;

@Repository("buyDAO")
public class BuyDAOImpl implements BuyDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	@Override
	public int addBuy(BuyVO vo) {
		return mybatis.insert("BuyDAO.addBuy", vo);
	}

}
