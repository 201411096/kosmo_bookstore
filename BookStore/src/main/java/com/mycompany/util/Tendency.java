package com.mycompany.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.TendencyVO;
import com.mycompany.service.TendencyServiceImpl;

public class Tendency {
	private static Tendency tendency = null;
	private Tendency() {}
	public static Tendency getInstance() {
		if(tendency==null) {
			tendency = new Tendency();
		}
		return tendency;
	}
	public void increaseTendency(HttpSession session, TendencyServiceImpl tendencyService, CustomerVO customerVO, BookVO bookVO, int option) {
		Map<String, String> tendencyMap = new HashMap<String, String>();
		tendencyMap.put("customerId", customerVO.getCustomerId());
		tendencyMap.put("genre", bookVO.getBookGenre());
		if(option==1)			// 도서 조회시 1씩 증가
			tendencyService.increaseTendency(tendencyMap);
		else if(option==2)		// 도서 구매시 10씩 증가
			tendencyService.increaseTendency2(tendencyMap);
	}
	public void getCustomerTendency(HttpSession session, TendencyServiceImpl tendencyService, ModelAndView mv) {
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		TendencyVO tendencyVO = tendencyService.selectTendency(customerVO);		
		mv.addObject("tendency", tendencyVO);
	}
	public void getTotalTendency(TendencyServiceImpl tendencyService, ModelAndView mv) {
		TendencyVO tendencyVO = tendencyService.selectAllTendency();
		tendencyVO.setCustomerId("AllCustomer");
		mv.addObject("totalTendency", tendencyVO);
	}
}
