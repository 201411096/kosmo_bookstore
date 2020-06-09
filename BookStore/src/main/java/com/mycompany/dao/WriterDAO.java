package com.mycompany.dao;


import java.util.List;
import java.util.Map;

import com.mycompany.domain.WriterVO;

public interface WriterDAO {

	public int insertWriter(WriterVO vo);
	public List<WriterVO> selectWriter(WriterVO vo);
	public int updateWriter(WriterVO vo);
	public int deleteWriter(WriterVO vo);
	public List<WriterVO> selectWriterSearchByName(String searchWord);
	public WriterVO selectWriterByWriterId(WriterVO vo);
	public List<WriterVO> selectWriterSearchByNameWithPaging(Map map);
	public int selectWriterCntByNameWithPaging(String searchWord);
}
