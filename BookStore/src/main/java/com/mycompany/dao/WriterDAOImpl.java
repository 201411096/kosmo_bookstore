package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.WriterVO;

@Repository("writerDAO")
public class WriterDAOImpl {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int insertWriter(WriterVO vo) {
		int result = mybatis.insert("WriterDAO.insertWriter", vo);
		return result;
	}


	public List<WriterVO> selectWirter(WriterVO vo) {
		List<WriterVO> writer = mybatis.selectList("WriterDAO.selectWriter", vo);
		return writer;
	}


	public int updateWriter(WriterVO vo) {
		int result = mybatis.update("WriterDAO.updateWriter", vo);
		return result;
	}


	public int deleteWriter(WriterVO vo) {
		int result = mybatis.delete("WriterDAO.deleteWriter", vo);
		return result;
	}
}
