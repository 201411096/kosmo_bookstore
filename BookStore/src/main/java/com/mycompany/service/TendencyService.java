package com.mycompany.service;

import java.util.Map;

import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.TendencyVO;

public interface TendencyService {
	public int insertTendency(CustomerVO vo);
	public int increaseTendency(Map<String, String> tendencyMap);
	public int increaseTendency2(Map<String, String> tendencyMap);
	public TendencyVO selectTendency(CustomerVO customerVO);
}
