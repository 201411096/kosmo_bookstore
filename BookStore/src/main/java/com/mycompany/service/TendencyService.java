package com.mycompany.service;

import java.util.Map;

import com.mycompany.domain.CustomerVO;

public interface TendencyService {
	public int insertTendency(CustomerVO vo);
	public int increaseTendency(Map<String, String> tendencyMap);
}
