package com.mycompany.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycompany.domain.StoreVO;


public interface StoreService {
	
	public List<StoreVO> selectStoreSearchByName(String searchWord);
	public int insertStore(StoreVO storevo);
	public int deleteStore(StoreVO storevo);
	public StoreVO selectStoreByStoreId(StoreVO storevo);
	public int updateStore(StoreVO storevo);
	public List<StoreVO> selectStore(StoreVO storevo);

}
