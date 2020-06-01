package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.BuyCartListVO;
import com.mycompany.domain.CustomerVO;

public interface CustomerService {
	public CustomerVO selectCustomer(CustomerVO vo);
	public int getCartListNumber(String customerId);
	public int getCartListTotalPrice(String customerId);
	public List<BuyCartListVO> getCartList(String customerId);
}
