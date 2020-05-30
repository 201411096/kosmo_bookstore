package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BookVO;
@Repository("bookDAO")
public class BookDAOImpl implements BookDAO{
   @Autowired
   private SqlSessionTemplate mybatis;

   @Override
   public BookVO selectBook(BookVO vo) {
      BookVO result = mybatis.selectOne("BookDAO.selectBook", vo);
      return result;
   }

	@Override
	public List<BookVO> searchListBook(Map<String, String> search) {
		List<BookVO> list = mybatis.selectList("BookDAO.searchList", search); 
		return list;
	}
   

}