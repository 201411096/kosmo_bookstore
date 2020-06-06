package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.ReviewVO;
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

	@Override
	public List<BookVO> selectBannerBook() {
		return mybatis.selectList("BookDAO.selectBannerBook");
	}

	@Override
	public List<BookVO> selectBestSeller() {
		return mybatis.selectList("BookDAO.selectBestSeller");
	}

	@Override
	public int updateBookSocreByDeletePrevRecord(ReviewVO reviewVO) {
		return mybatis.update("BookDAO.updateBookSocreByDeletePrevRecord", reviewVO);
	}

	@Override
	public int updateBookScore(ReviewVO reviewVO) {
		return mybatis.update("BookDAO.updateBookScore", reviewVO);
	}
    
	
}