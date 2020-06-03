package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	@Override
	public List<BuyCartListVO> getCartList(BuyCartListVO vo) {
		return mybatis.selectList("BuyCartListDAO.getCartList", vo);
	}
	@Override
	public int deleteCartList(BuyCartListVO vo) {
		return mybatis.delete("BuyCartListDAO.deleteCartList", vo);
	}
	@Override
	public int updateCartList(BuyCartListVO vo) {
		return mybatis.update("BuyCartListDAO.updateCartList", vo);
	}
	@Override
	public int clearCurrentCustomerCartList(BuyCartListVO vo) {
		return mybatis.delete("BuyCartListDAO.clearCurrentCustomerCartList", vo);
	}
	
}
