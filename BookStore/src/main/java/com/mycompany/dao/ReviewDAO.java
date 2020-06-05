package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.ReviewVO;


public interface ReviewDAO {
	public int insertReview(ReviewVO vo);
	public List<ReviewVO> selectReview(ReviewVO vo);
	public ReviewVO selectReviewByCustomerId(ReviewVO vo);
	public ReviewVO selectReviewByReviewId(int reviewId);
	public int updateReview(ReviewVO vo);
	public int deleteReview(ReviewVO vo);
}
