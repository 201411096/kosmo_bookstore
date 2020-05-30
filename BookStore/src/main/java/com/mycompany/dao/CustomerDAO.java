package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.BookCartVO;
import com.mycompany.domain.CustomerVO;

public interface CustomerDAO {
	public CustomerVO selectCustomer(CustomerVO vo);
	public int getCartListNumber(String customerId);
	public int getCartListTotalPrice(String customerId);
	public List<BookCartVO> getCartList(String customerId);
}
