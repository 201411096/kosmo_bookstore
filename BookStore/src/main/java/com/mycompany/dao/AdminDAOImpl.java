package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BookVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

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

	@Override
	public List<Map> selectSalesWithOptions(Map searchMap) {
		return mybatis.selectList("AdminDAO.selectSalesWithOptions", searchMap);
	}

	@Override
	public List<Map> getGenreSalesData() {
		return mybatis.selectList("AdminDAO.getGenreSalesData");
	}

	public List<BookVO> selectProductSearchByNameWithPaging(Map map) {
		return mybatis.selectList("AdminDAO.selectProductSearchByNameWithPaging", map);
	}

	public int selectProductCntByNameWithPaging(String searchWord) {
		return mybatis.selectOne("AdminDAO.selectProductCntByNameWithPaging", searchWord);

	}
}
