package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.TendencyVO;

public interface TendencyService {
	public int insertTendency(CustomerVO vo);
	public int increaseTendency(Map<String, String> tendencyMap);
	public int increaseTendency2(Map<String, String> tendencyMap);
	public TendencyVO selectTendency(CustomerVO customerVO);
	public TendencyVO selectAllTendency();
	public BookVO selectOneByGenre(BookVO vo);
	public List<BookVO> selectAllByGenreWithScore(BookVO vo);
}
