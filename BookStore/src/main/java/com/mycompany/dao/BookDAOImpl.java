package com.mycompany.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
@Repository("bookDAO")
public class BookDAOImpl implements BookDAO{
   @Autowired
   private SqlSessionTemplate mybatis;

   @Override
   public BookVO selectBook(BookVO vo) {
      BookVO result = mybatis.selectOne("BookDAO.selectBook", vo);
      return result;
   }
   

}