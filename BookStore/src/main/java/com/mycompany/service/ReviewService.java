package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.ReviewVO;

public interface ReviewService {
	public int insertReview(ReviewVO vo);
	public List<ReviewVO> selectReview(ReviewVO vo);
}