package com.mycompany.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
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
		if(option==1)
			tendencyService.increaseTendency(tendencyMap);
	}
}
