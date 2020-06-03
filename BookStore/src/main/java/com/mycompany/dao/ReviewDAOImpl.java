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
		System.out.println(vo.getBuyreviewContent() + ">>>>");
		int result = mybatis.insert("ReviewDAO.insertReview", vo);
		return result;
	}

	@Override
	public List<ReviewVO> selectReview(ReviewVO vo) {
		List<ReviewVO> result = mybatis.selectList("ReviewDAO.selectReview", vo);
		return result;
	}
	



	

	
	
}
