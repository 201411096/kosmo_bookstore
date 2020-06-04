package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.StoreVO;

public interface StoreDAO {
	public List<StoreVO> selectStore();
}
