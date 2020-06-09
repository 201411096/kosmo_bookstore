package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.WriterVO;

public interface AdminService {

	public int insertProduct(BookVO bookvo);
	public List<BookVO> selectProduct(BookVO bookvo);
	public int updateProduct(BookVO bookvo);
	public int deleteProduct(BookVO bookvo);

}
