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
	public List<StoreVO> selectStore() {
		return mybatis.selectList("StoreDAO.selectStore");
	}

}
