package com.mycompany.dao;


import java.util.List;

import com.mycompany.domain.StoreVO;

public interface StoreDAO {
	
	public int insertStore(StoreVO storevo);
	public List<StoreVO> selectStoreSearchByName(String searchWord);
	public int deleteStore(StoreVO storevo);
	public StoreVO selectStoreByStoreId(StoreVO storevo);
	public int updateStore(StoreVO storevo);
	public List<StoreVO> selectStore(StoreVO storevo); //contact
	
	

}
