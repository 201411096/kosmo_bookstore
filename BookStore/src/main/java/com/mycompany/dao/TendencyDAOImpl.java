package com.mycompany.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.TendencyVO;

@Repository("tendencyDAO")
public class TendencyDAOImpl implements TendencyDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int insertTendency(CustomerVO vo) {
		int result = mybatis.insert("TendencyDAO.insertTendency", vo);
		return result;
	}

	@Override
	public int increaseTendency(Map<String, String> tendencyMap) {
		int result = mybatis.update("TendencyDAO.increaseTendency", tendencyMap);
		return result;
	}
	
	@Override
	public int increaseTendency2(Map<String, String> tendencyMap) {
		int result = mybatis.update("TendencyDAO.increaseTendency2", tendencyMap);
		return result;
	}

	@Override
	public TendencyVO selectTendency(CustomerVO customerVO) {
		return mybatis.selectOne("TendencyDAO.selectTendency", customerVO);
	}

	@Override
	public TendencyVO selectAllTendency() {
		return mybatis.selectOne("TendencyDAO.selectAllTendency");
	}
	
	
	
}
