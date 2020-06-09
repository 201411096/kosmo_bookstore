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

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.WriterVO;
import com.mycompany.service.AdminServiceImpl;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.WriterServiceImpl;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	WriterServiceImpl writerService;
	@Autowired
	BookServiceImpl bookService;
	@Autowired
	AdminServiceImpl adminService;
	
	@RequestMapping("/admin/dashboard.do")
	public ModelAndView moveToAdminDashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		if(customerVO ==null || customerVO.getCustomerFlag()==1)
		{
			mv.setViewName("redirect:/moveToLogin.do");
			return mv;
		}
		mv.setViewName("/admin/dashboard");
		return mv;
	}
	@RequestMapping("/admin/leftSidebar.do")
	public ModelAndView loadLeftSidebar() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/leftSidebar");
		return mv;
	}
	@RequestMapping("/admin/topbar.do")
	public ModelAndView loadTopbar() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/topbar");
		return mv;
	}
	@RequestMapping("/admin/writer.do")
	public ModelAndView loadAdminWriter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writer");
		return mv;
	}
	@RequestMapping("/admin/product.do")
	public ModelAndView loadAdminProduct() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_product");
		return mv;
	}
	
	@RequestMapping(value="/admin/getProductData.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getWriterData(HttpSession session, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();		
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> bookList = bookService.searchListBook(search);
		result.put("bookList", bookList);
		result.put("bookListSize", bookList.size());
		return result;
	}
	@RequestMapping(value="/admin/loadInsertProduct.do")
	public ModelAndView prodcutInsertPage(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/admin_productInsert");
		return mv;
	}
	@RequestMapping(value="/admin/insertProduct.do")
	public ModelAndView productInsert(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		
		//제품 등록해야되는 부분
		adminService.insertProduct(bookVO);
		mv.setViewName("/admin/admin_product");
		return mv;
	}
	@RequestMapping(value="/admin/productDelete.do")
	public ModelAndView writerDelete(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		adminService.deleteProduct(bookVO);
		mv.setViewName("/admin/admin_product");
		return mv;
	}
}
