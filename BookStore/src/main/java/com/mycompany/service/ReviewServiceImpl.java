package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.ReviewDAOImpl;
import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAOImpl reviewDAO;
	
	@Override
	public int insertReview(ReviewVO vo) {
		return reviewDAO.insertReview(vo);		 
	}
	
	@Override
	public List<ReviewVO> selectReview(ReviewVO vo) {
		return reviewDAO.selectReview(vo);
		
	}




	
}
