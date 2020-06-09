package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BookVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;


	@Override
	public int insertProduct(BookVO vo) {
		int result = mybatis.insert("AdminDAO.insertProduct", vo);
		return result;
	}

	@Override
	public List<BookVO> selectProduct(BookVO bookvo) {
		List<BookVO> book = mybatis.selectList("AdminDAO.selectProduct", bookvo);
		return book;
	}

	public int updateProduct(BookVO bookvo) {
		int result = mybatis.update("AdminDAO.updateProduct", bookvo);
		return result;
	}

	public int deleteProduct(BookVO bookvo) {
		int result = mybatis.delete("AdminDAO.deleteProduct", bookvo);
		return result;
	}

	public List<Map> selectDSales(BookVO bookvo) {
		List<Map> dSales=mybatis.selectList("AdminDAO.selectDSales", bookvo);
		return dSales;
	}

	public List<Map> selectMSales(BookVO bookvo) {
		List<Map> mSales=mybatis.selectList("AdminDAO.selectMSales", bookvo);
		return mSales;
	}

}
