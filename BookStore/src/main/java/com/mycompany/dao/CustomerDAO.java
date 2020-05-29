package com.mycompany.dao;

import com.mycompany.domain.CustomerVO;

public interface CustomerDAO {
	public CustomerVO selectCustomer(CustomerVO vo);
	public int getCartListNumber(String customerId);
	public int getCartListTotalPrice(String customerId);
}
