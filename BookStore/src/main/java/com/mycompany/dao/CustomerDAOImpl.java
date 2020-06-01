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

//	@Override
//	public int getCartListNumber(String customerId) {
//		if(mybatis.selectOne("CustomerDAO.getCartListNumber", customerId)==null)
//			return 0;
//		else
//			return mybatis.selectOne("CustomerDAO.getCartListNumber", customerId); 
//		
//	}
//
//	@Override
//	public int getCartListTotalPrice(String customerId) {
//		if(mybatis.selectOne("CustomerDAO.getCartListTotalPrice", customerId)==null)
//			return 0;
//		else
//			return mybatis.selectOne("CustomerDAO.getCartListTotalPrice", customerId);
//	}

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
