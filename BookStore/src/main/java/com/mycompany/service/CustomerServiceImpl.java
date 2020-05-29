package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.CustomerDAOImpl;
import com.mycompany.domain.CustomerVO;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerDAOImpl customerDAO;
	@Override
	public CustomerVO selectCustomer(CustomerVO vo) {
		return customerDAO.selectCustomer(vo);
	}

}
