package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.WriterVO;
import com.mycompany.service.WriterServiceImpl;

@Controller
public class WriterController {
	private static final Logger logger = LoggerFactory.getLogger(WriterController.class);
	@Autowired
	WriterServiceImpl writerService;
	
	/* ----- 이제 사용하지 않음 => 페이징 처리가 되는 버전 사용 -----
	 * 함수 이름 : getWriterData
	 * 주요 기능 : 저자의 정보를 가져옴
	 * 함수 내용 : 
	 * 반환 위치 : admin_writer.js				 
	 */
	@RequestMapping(value="/admin/getWriterData.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getWriterData(HttpSession session, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();		
		List<WriterVO> writerList =  writerService.selectWriterSearchByName(searchWord);
		
		result.put("writerList", writerList);
		result.put("writerListSize", writerList.size());
		return result;
	}
	/*
	 * 함수 이름 : loadWriterUpdatePage
	 * 주요 기능 : 저자의 정보 수정 페이지를 불러옴
	 * 함수 내용 : 해당 저자의 정보를 불러와서 수정 페이지에 입려시켜둠
	 * 반환 위치 : admin_writerUpdate.jsp			 
	 */
	@RequestMapping(value="/admin/loadWriterUpdatePage.do")
	public ModelAndView loadWriterUpdatePage(HttpSession session, int writerId) {
		ModelAndView mv = new ModelAndView();
		WriterVO writerVO = new WriterVO();
		writerVO.setWriterId(writerId);
		writerVO = (WriterVO)writerService.selectWriterByWriterId(writerVO);
		mv.addObject("writerVO", writerVO);
		mv.setViewName("/admin/admin_writerUpdate");
		return mv;
	}
	/*
	 * 함수 이름 : writerUpdate
	 * 주요 기능 : 저자의 정보를 수정함
	 * 함수 내용 : --			 
	 */
	@RequestMapping(value="/admin/writerUpdatePage.do")
	public ModelAndView writerUpdate(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		writerService.updateWriter(writerVO);
		//mv.setViewName("/admin/admin_writer"); 페이징 처리하는 아랫줄로 대체
		mv.setViewName("/admin/admin_writer_pagination");
		return mv;
	}
	/*
	 * 함수 이름 : writerDelete
	 * 주요 기능 : 저자의 정보를 삭제함
	 * 함수 내용 : --			 
	 */
	@RequestMapping(value="/admin/writerDelete.do")
	public ModelAndView writerDelete(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		writerService.deleteWriter(writerVO);
//		mv.setViewName("/admin/admin_writer");
		mv.setViewName("/admin/admin_writer_pagination");
		return mv;
	}
	/*
	 * 함수 이름 : writerInsertPage
	 * 주요 기능 : 저자 정보 입력 페이지를 불러옴
	 * 함수 내용 : --			 
	 */
	@RequestMapping(value="/admin/loadInsertWriter.do")
	public ModelAndView writerInsertPage(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writerInsert");
		return mv;
	}
	/*
	 * 함수 이름 : writerInsert
	 * 주요 기능 : 저자 정보를 입력함
	 * 함수 내용 : --			 
	 */
	@RequestMapping(value="/admin/insertWriter.do")
	public ModelAndView writerInsert(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		writerService.insertWriter(writerVO);
//		mv.setViewName("/admin/admin_writer");
		mv.setViewName("/admin/admin_writer_pagination");
		return mv;
	}
	/*
	 * 함수 이름 : getWriterDataWithPaging
	 * 주요 기능 : 저자 정보를 검색후 그 결과에 맞춰서 페이징 처리를 한 후에 반환
	 * 함수 내용 : 저자 정보 반환
	 * 		ㄴ 검색 결과에 따른 동적 페이징 처리	
	 * 참고사항 : PaginationVO	 
	 */
	@RequestMapping(value="/admin/getWriterDataWithPaging.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getWriterDataWithPaging(HttpSession session,  @RequestParam(defaultValue="1") int curPage, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();		
		
		int listCnt = writerService.selectWriterCntByNameWithPaging(searchWord);
		
		PaginationVO paginationVO = new PaginationVO(listCnt, curPage);
		Map searchMap = new HashMap();
		searchMap.put("searchWord", searchWord);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		List<WriterVO> writerList = writerService.selectWriterSearchByNameWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("writerList", writerList);
		result.put("writerListSize", writerList.size());
		
		return result;
	}

}
