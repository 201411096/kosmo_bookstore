package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.BookDAOImpl;
import com.mycompany.domain.BookVO;

@Service("bookService")
public class BookServiceImpl implements BookService{
   @Autowired
   private BookDAOImpl BookDAO;
   @Override
   public BookVO selectBook(BookVO vo) {
      return BookDAO.selectBook(vo);
   }

}