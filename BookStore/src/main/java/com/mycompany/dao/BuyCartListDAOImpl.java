package com.mycompany.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.BuyCartListVO;
@Repository("buyCartListDAO")
public class BuyCartListDAOImpl implements BuyCartListDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	@Override
	public int addCartList(BuyCartListVO vo) {
		return mybatis.insert("BuyCartListDAO.addCartList", vo);   
	}
	@Override
	public BuyCartListVO checkDuplicateCartList(BuyCartListVO vo) {
		return mybatis.selectOne("BuyCartListDAO.checkDuplicateCartList", vo);		
	}
	@Override
	public int cartListChangeCnt(BuyCartListVO vo) {
		return mybatis.update("BuyCartListDAO.cartListChangeCnt", vo);
	}

}
