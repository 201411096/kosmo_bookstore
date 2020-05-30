package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BookCartVO;
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
	public int getCartListNumber(String customerId) {
		return mybatis.selectOne("CustomerDAO.getCartListNumber", customerId);
	}

	@Override
	public int getCartListTotalPrice(String customerId) {
		return mybatis.selectOne("CustomerDAO.getCartListTotalPrice", customerId);
	}

	@Override
	public List<BookCartVO> getCartList(String customerId) {
		List<BookCartVO> result = mybatis.selectList("CustomerDAO.getCartList", customerId);
		return result;
	}
	
	
}
