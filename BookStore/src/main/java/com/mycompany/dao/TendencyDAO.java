package com.mycompany.dao;

import java.util.Map;

import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.TendencyVO;

public interface TendencyDAO {	
	public int insertTendency(CustomerVO vo);
	public int increaseTendency(Map<String, String> tendencyMap);
	public int increaseTendency2(Map<String, String> tendencyMap);
	public TendencyVO selectTendency(CustomerVO customerVO);
}
