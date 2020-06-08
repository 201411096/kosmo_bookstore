package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;

public interface BookService {
   public BookVO selectBook(BookVO vo);
   public List<BookVO> searchListBook(Map<String, String> search);
   public List<BookVO> selectBannerBook();
   public List<BookVO> selectBestSeller();
   public int updateBookSocreByDeletePrevRecord(ReviewVO reviewVO);
   public int updateBookScore(ReviewVO reviewVO);
   public List<BookVO> selectRelatedBook(BookVO vo);
}