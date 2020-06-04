package com.mycompany.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycompany.domain.StoreVO;


public interface StoreService {
	public List<StoreVO> selectStore();
}
