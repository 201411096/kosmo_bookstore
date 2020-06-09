package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.WriterDAOImpl;
import com.mycompany.domain.WriterVO;

@Service("writerService")
public class WriterServiceImpl implements WriterService{
	
	@Autowired
	private WriterDAOImpl writerDAO;
	
	
	public int insertWriter(WriterVO vo) {
		return writerDAO.insertWriter(vo);	
	}


	public List<WriterVO> selectWriter(WriterVO vo) {
		return writerDAO.selectWriter(vo);	
	}

	public int updateWriter(WriterVO vo) {
		return writerDAO.updateWriter(vo);
	}

	public int deleteWriter(WriterVO vo) {
		return writerDAO.deleteWriter(vo);
	}

	@Override
	public List<WriterVO> selectWriterSearchByName(String searchWord) {
		return writerDAO.selectWriterSearchByName(searchWord);
	}
}
