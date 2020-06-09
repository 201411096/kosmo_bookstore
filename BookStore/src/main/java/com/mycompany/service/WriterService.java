package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.WriterVO;

public interface WriterService {

	public int insertWriter(WriterVO vo);
	public List<WriterVO> selectWriter(WriterVO vo);
	public int updateWriter(WriterVO vo);
	public int deleteWriter(WriterVO vo);
	public List<WriterVO> selectWriterSearchByName(String searchWord);
	public WriterVO selectWriterByWriterId(WriterVO vo);
}
