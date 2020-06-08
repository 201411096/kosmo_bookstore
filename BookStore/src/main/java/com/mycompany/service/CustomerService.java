package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;

public interface CustomerService {
	public CustomerVO selectCustomer(CustomerVO vo);
	public List<BuyCartListVO> getCartList(String customerId);
	public int insertCustomer(CustomerVO vo);
	public int makeTemporaryPassword(CustomerVO vo);
}
