package com.mycompany.service;

import com.mycompany.domain.CustomerVO;

public interface CustomerService {
	public CustomerVO selectCustomer(CustomerVO vo);
	public int getCartListNumber(String customerId);
	public int getCartListTotalPrice(String customerId);
}
