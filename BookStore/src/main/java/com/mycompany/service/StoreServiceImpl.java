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
	public List<StoreVO> selectStoreSearchByName(String searchWord) {
		return storeDAO.selectStoreSearchByName(searchWord);
	}
	
	@Override
	public int insertStore(StoreVO storevo) {
		return storeDAO.insertStore(storevo);
	}
	
	@Override
	public int deleteStore(StoreVO storevo) {
		return storeDAO.deleteStore(storevo);
		
	}

	@Override
	public StoreVO selectStoreByStoreId(StoreVO storevo) {
		return storeDAO.selectStoreByStoreId(storevo);
	}
	
	@Override
	public int updateStore(StoreVO storevo) {
		return storeDAO.updateStore(storevo);
		
	}

	public List<StoreVO> selectStore(StoreVO storevo) {
		return storeDAO.selectStore(storevo);
		
	}

	
	

}
