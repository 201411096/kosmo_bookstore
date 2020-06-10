package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BookVO;

public interface AdminDAO {

	public int insertProduct(BookVO vo);
	public List<BookVO> selectProduct(BookVO bookvo);
	public int updateProduct(BookVO bookvo);
	public int deleteProduct(BookVO bookvo);
	public List<Map> selectSalesWithOptions(Map searchMap);
	public List<Map> getGenreSalesData();
	public int selectProductCntByNameWithPaging(String searchWord);
	public List<BookVO> selectProductSearchByNameWithPaging(Map map);
	
	public int selectProductListCountWithFiltering(Map map);
	public List<BookVO> selectProductListWithFiltering(Map map);
}
