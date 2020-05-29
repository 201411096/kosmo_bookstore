package com.mycompany.service;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;

public interface BookService {
   BookVO selectBook(BookVO vo);
}