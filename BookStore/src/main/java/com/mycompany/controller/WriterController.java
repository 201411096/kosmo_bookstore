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

import com.mycompany.domain.WriterVO;
import com.mycompany.service.WriterServiceImpl;

@Controller
public class WriterController {
	@Autowired
	WriterServiceImpl writerService;

//	// 저자 등록
//	@RequestMapping("/addWriter.do")
//	public ModelAndView insertWriter(WriterVO vo) {
//		System.out.println("등록1:" + vo.getWriterName());
//		ModelAndView mv = new ModelAndView();
//		int writer = writerService.insertWriter(vo);
//		mv.addObject("writer", writer);
//		
//		System.out.println("등록2:" + vo.getWriterName());
//		if (writer == 1) {
//			mv.setViewName("redirect:/admin_writerList.do");
//
//		} else {
//			mv.setViewName("/adminMain");
//		}
//		return mv;
//	}
//
//	// 저자 출력
//	@RequestMapping("/admin_writerList.do")
//	public ModelAndView selectWriter(WriterVO vo) {
//		ModelAndView mv = new ModelAndView();
//
//		List<WriterVO> writer = writerService.selectWriter(vo);
//		mv.addObject("writer", writer);
//
//		return mv;
//	}
//	
//	//수정시 객체 가져오기
//	@RequestMapping("/writer_update.do")
//	public ModelAndView updatePage(WriterVO vo) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("vo", vo);
////		mv.setViewName("adminUpdateWriter");
//		mv.setViewName("admin_writer");
//		return mv;
//	}
//
//	// 수정(조건 bookId)
//	@RequestMapping("/adminUpdateWriter.do")
//	public ModelAndView updateWriter(WriterVO vo) {
//		ModelAndView mv = new ModelAndView();
//		int result = writerService.updateWriter(vo);
//
//		if (result == 1) {
//			mv.setViewName("redirect:/admin_writerList.do");
//		} else {
//			mv.setViewName("/adminMain");
//		}
//		return mv;
//	}
//
//	// 삭제
//	@RequestMapping("/deleteWriter.do")
//	public ModelAndView deleteProduct(WriterVO vo) {
//		ModelAndView mv = new ModelAndView();
//		System.out.println(vo.getWriterId());
//		System.out.println(vo.getWriterName());
//		int result = writerService.deleteWriter(vo);
//		if (result == 1) {
//			mv.setViewName("redirect:/admin_writerList.do");
//		} else {
//			mv.setViewName("/adminMain");
//		}
//		return mv;
//	}
	
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

}
