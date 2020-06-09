package com.mycompany.dao;


import java.util.List;

import com.mycompany.domain.WriterVO;

public interface WriterDAO {

	public int insertWriter(WriterVO vo);
	public List<WriterVO> selectWriter(WriterVO vo);
	public int updateWriter(WriterVO vo);
	public int deleteWriter(WriterVO vo);
}
