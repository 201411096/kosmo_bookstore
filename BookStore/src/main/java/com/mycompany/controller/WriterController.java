package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	@Autowired
	WriterServiceImpl writerService;
	
	//0609 이후 추가--------------------
	@RequestMapping(value="/admin/getWriterData.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getWriterData(HttpSession session, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();		
		List<WriterVO> writerList =  writerService.selectWriterSearchByName(searchWord);
		
		result.put("writerList", writerList);
		result.put("writerListSize", writerList.size());
		return result;
	}
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
	@RequestMapping(value="/admin/writerUpdatePage.do")
	public ModelAndView writerUpdate(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		writerService.updateWriter(writerVO);
		mv.setViewName("/admin/admin_writer");
		return mv;
	}
	@RequestMapping(value="/admin/writerDelete.do")
	public ModelAndView writerDelete(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		writerService.deleteWriter(writerVO);
		mv.setViewName("/admin/admin_writer");
		return mv;
	}
	@RequestMapping(value="/admin/loadInsertWriter.do")
	public ModelAndView writerInsertPage(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writerInsert");
		return mv;
	}
	@RequestMapping(value="/admin/insertWriter.do")
	public ModelAndView writerInsert(HttpSession session, WriterVO writerVO) {
		ModelAndView mv = new ModelAndView();
		writerService.insertWriter(writerVO);
		mv.setViewName("/admin/admin_writer");
		return mv;
	}
	//페이징처리
	@RequestMapping(value="/admin/getWriterDataWithPaging.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getWriterDataWithPaging(HttpSession session,  @RequestParam(defaultValue="1") int curPage, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();		
		//List<WriterVO> writerList =  writerService.selectWriterSearchByName(searchWord);
		
		int listCnt = writerService.selectWriterCntByNameWithPaging(searchWord);
		
		System.out.println("controller안에서 curPage 확인 : " + curPage);
		PaginationVO paginationVO = new PaginationVO(listCnt, curPage);
		Map searchMap = new HashMap();
		searchMap.put("searchWord", searchWord);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		List<WriterVO> writerList = writerService.selectWriterSearchByNameWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("writerList", writerList);
		result.put("writerListSize", writerList.size());
		System.out.println("controller안에서 writerList 확인 : " + writerList);
		System.out.println("controller안에서 writerListSize 확인 : " + writerList.size());
		System.out.println("startRow  확인 : " + paginationVO.getStartIndex()+1);
		System.out.println("endRow  확인 : " + (paginationVO.getStartIndex()+paginationVO.getPageSize()));
		return result;
	}

}
