package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.CustomerDAOImpl;
import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerDAOImpl customerDAO;
	@Override
	public CustomerVO selectCustomer(CustomerVO vo) {
		return customerDAO.selectCustomer(vo);
	}
	@Override
	public int getCartListNumber(String customerId) {
		return customerDAO.getCartListNumber(customerId);
	}
	@Override
	public int getCartListTotalPrice(String customerId) {
		return customerDAO.getCartListTotalPrice(customerId);
	}
	@Override
	public List<BuyCartListVO> getCartList(String customerId) {
		return customerDAO.getCartList(customerId);
	}
}
