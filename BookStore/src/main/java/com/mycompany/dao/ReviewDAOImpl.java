package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int insertReview(ReviewVO vo) {
		int result = mybatis.insert("ReviewDAO.insertReview", vo);
		return result;
	}
	@Override
	public List<ReviewVO> selectReview(ReviewVO vo) {
		List<ReviewVO> result = mybatis.selectList("ReviewDAO.selectReview", vo);
		return result;
	}
	@Override
	public ReviewVO selectReviewByCustomerId(ReviewVO vo) {
		return mybatis.selectOne("ReviewDAO.selectReviewByCustomerId", vo);
	}
	@Override
	public ReviewVO selectReviewByReviewId(int reviewId) {
		return mybatis.selectOne("ReviewDAO.selectReviewByReviewId", reviewId);
	}
	@Override
	public int updateReview(ReviewVO vo) {
		return mybatis.update("ReviewDAO.updateReview", vo);
	}
	@Override
	public int deleteReview(ReviewVO vo) {
		return mybatis.delete("ReviewDAO.deleteReview", vo);
	}
}
