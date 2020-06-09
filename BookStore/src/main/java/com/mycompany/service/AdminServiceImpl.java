package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.AdminDAOImpl;
import com.mycompany.domain.BookVO;
import com.mycompany.domain.WriterVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAOImpl adminDAO;
	
	public int insertProduct(BookVO bookvo) {
		return adminDAO.insertProduct(bookvo);
	}

	public List<BookVO> selectProduct(BookVO bookvo) {
		return adminDAO.selectProduct(bookvo);
	}

	public int updateProduct(BookVO bookvo) {
		return adminDAO.updateProduct(bookvo);
		
	}

	public int deleteProduct(BookVO bookvo) {
		return adminDAO.deleteProduct(bookvo);
	}


}
