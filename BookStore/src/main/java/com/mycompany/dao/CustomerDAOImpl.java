package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;

@Repository("customerDAO")
public class CustomerDAOImpl implements CustomerDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public CustomerVO selectCustomer(CustomerVO vo) {
		CustomerVO result = mybatis.selectOne("CustomerDAO.selectCustomer", vo);
		return result;
	}
	
	@Override
	public List<BuyCartListVO> getCartList(String customerId) {
		List<BuyCartListVO> result = mybatis.selectList("CustomerDAO.getCartList", customerId);
		return result;
	}
	
	@Override
	public int insertCustomer(CustomerVO vo) {
		int result =  mybatis.insert("CustomerDAO.insertCustomer", vo);
		return result;
	}
}
