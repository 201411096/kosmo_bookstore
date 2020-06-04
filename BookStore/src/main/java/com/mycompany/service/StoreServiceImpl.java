package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.StoreDAOImpl;
import com.mycompany.domain.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	StoreDAOImpl storeDAO;
	@Override
	public List<StoreVO> selectStore() {
		return storeDAO.selectStore();
	}

}
