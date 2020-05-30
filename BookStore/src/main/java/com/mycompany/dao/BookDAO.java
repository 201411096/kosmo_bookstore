package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BookVO;

public interface BookDAO {
   public BookVO selectBook(BookVO vo);
   public List<BookVO> searchListBook(Map<String, String> search);
}