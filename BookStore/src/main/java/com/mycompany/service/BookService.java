package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;

public interface BookService {
   public BookVO selectBook(BookVO vo);
   public List<BookVO> searchListBook(Map<String, String> search);
}