package com.mycompany.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.StoreVO;

@Repository("storeDAO")
public class StoreDAOImpl implements StoreDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int insertStore(StoreVO storevo) {
		int result = mybatis.insert("StoreDAO.insertStore", storevo);
		return result;
	}
	
	@Override
	public int deleteStore(StoreVO storevo) {
		int result = mybatis.delete("StoreDAO.deleteStore", storevo);
		return result;
	}

	@Override
	public StoreVO selectStoreByStoreId(StoreVO storevo) {
		return mybatis.selectOne("StoreDAO.selecrStoreByStoreId", storevo);
	}

	@Override
	public int updateStore(StoreVO storevo) {
		int result = mybatis.update("StoreDAO.updateStore", storevo);
		return result;
	}

	@Override
	public List<StoreVO> selectStoreSearchByName(String searchWord) {
		return mybatis.selectList("StoreDAO.selectStoreSearchByName", searchWord );
	}

	//contact
	public List<StoreVO> selectStore(StoreVO storevo) {
		mybatis.selectList("storeDAO.selectStore", storevo);
		return null;
	}

	

}
