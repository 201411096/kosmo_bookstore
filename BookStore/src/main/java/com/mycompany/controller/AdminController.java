package com.mycompany.controller;

import java.util.ArrayList;
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
import com.mycompany.service.AdminServiceImpl;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.WriterServiceImpl;
import com.mycompany.util.Sales;

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
	@RequestMapping(value="/admin/loadProductUpdatePage.do")
	public ModelAndView loadWriterUpdatePage(HttpSession session, int bookId) {
		ModelAndView mv = new ModelAndView();
		BookVO bookVO = new BookVO();
		bookVO.setBookId(bookId);
		bookVO = (BookVO)bookService.selectBook(bookVO);
		mv.addObject("bookVO", bookVO);
		mv.setViewName("/admin/admin_productUpdate");
		return mv;
	}
	@RequestMapping(value="/admin/productUpdatePage.do")
	public ModelAndView writerUpdate(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		adminService.updateProduct(bookVO);
		mv.setViewName("/admin/admin_product");
		return mv;
	}
	
	// 검색 window창 테스트
	@RequestMapping("/admin/admin_writer_window.do")
	public ModelAndView loadAdminWindowWriter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writer_window");
		return mv;
	}
	
	// wrtier pagination 테스트
	@RequestMapping("/admin/admin_writer_pagination.do")
	public ModelAndView loadTestWriter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writer_pagination");
		return mv;
	}
	
	@RequestMapping(value="/admin/getSalesDataWithOptions",  produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getSalesDataWithOptions(HttpSession session, @RequestParam(defaultValue = "3") int option, @RequestParam(defaultValue = "100") int chartDataCnt) {
		Map result = new HashMap();
		Map searchMap = new HashMap();
		searchMap.put("selectOption", Sales.getInstance().changeIntOptionToString(option)); //검색 옵션을 넣음(연도, 월별, 일별)
		List<Map> salesList = adminService.selectSalesWithOptions(searchMap);
		result.put("salesList", salesList); //사용하지 않음(테스트용)
		result.put("salesListSize", salesList.size()); //사용하지 않음(테스트용)
		
		List<Map> reducedSalesList = new ArrayList<Map>();
		for(int i=0; i<chartDataCnt; i++) {
			if(salesList.size()>i) { // 원하는 차트 데이터보다 데이터가 적을 경우 생기는 문제를 막음
				reducedSalesList.add(salesList.get(salesList.size()-i-1)); // 원하는 데이터가 60개 (41~100), 가져온 데이터가 100개(1~100) 일때  (1~60)이 아닌 (41~100)을 가져오기 위해 처리
			}	
			
		}		
		result.put("reducedSalesList", reducedSalesList);
		result.put("reducedSalesListSize", reducedSalesList.size());
		return result;
	}
}
