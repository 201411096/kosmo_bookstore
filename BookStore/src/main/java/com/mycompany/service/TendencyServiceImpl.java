package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.TendencyDAOImpl;
import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.TendencyVO;

@Service("tendencyService")
public class TendencyServiceImpl implements TendencyService{
	@Autowired
	private TendencyDAOImpl tendencyDAO;
	@Override
	public int insertTendency(CustomerVO vo) {
		int result = tendencyDAO.insertTendency(vo);
		return result;
	}
	@Override
	public int increaseTendency(Map<String, String> tendencyMap) {
		int result = tendencyDAO.increaseTendency(tendencyMap);
		return result;
	}
	@Override
	public int increaseTendency2(Map<String, String> tendencyMap) {
		int result = tendencyDAO.increaseTendency2(tendencyMap);
		return result;
	}
	@Override
	public TendencyVO selectTendency(CustomerVO customerVO) {
		return tendencyDAO.selectTendency(customerVO);
	}
	@Override
	public TendencyVO selectAllTendency() {
		return tendencyDAO.selectAllTendency();
	}
	@Override
	public BookVO selectOneByGenre(BookVO vo) {
		return tendencyDAO.selectOneByGenre(vo);
	}
	@Override
	public List<BookVO> selectAllByGenreWithScore(BookVO vo) {
		return tendencyDAO.selectAllByGenreWithScore(vo);
	}
	
}
