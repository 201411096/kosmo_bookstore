package com.mycompany.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
