package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.TendencyDAOImpl;
import com.mycompany.domain.CustomerVO;

@Service("tendencyService")
public class TendencyServiceImpl implements TendencyService{
	@Autowired
	private TendencyDAOImpl tendencyDAO;
	@Override
	public int insertTendency(CustomerVO vo) {
		int result = tendencyDAO.insertTendency(vo);
		return result;
	}
	
}
