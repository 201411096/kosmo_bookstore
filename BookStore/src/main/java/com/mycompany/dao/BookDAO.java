package com.mycompany.dao;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;

public interface BookDAO {
   public BookVO selectBook(BookVO vo);
}