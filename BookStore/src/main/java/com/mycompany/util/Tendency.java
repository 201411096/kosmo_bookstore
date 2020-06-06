package com.mycompany.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;
import com.mycompany.domain.TendencyVO;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.ReviewServiceImpl;
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
	//로그인한 상태의 사용자 선호장르 정보를 가져옴 (ajax없는버전에서 사용했었음)
	public void getCustomerTendency(HttpSession session, TendencyServiceImpl tendencyService, ModelAndView mv) {
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		TendencyVO tendencyVO = tendencyService.selectTendency(customerVO);
		tendencyVO.setElementToPercent();
		mv.addObject("tendency", tendencyVO);
		
		//가장 선호하는 장르의 책과 가장 선호하지 않는 장로의 책을 고름
		BookVO VOForSearch = new BookVO();
		String maxPrefferedGenre = tendencyVO.getMaxPreferredGenre();
		VOForSearch.setBookGenre(maxPrefferedGenre);
		BookVO bookInMaxPrefferedGenre = tendencyService.selectOneByGenre(VOForSearch);
		mv.addObject("bookInMaxPrefferedGenre", bookInMaxPrefferedGenre);
		String minPrefferedGenre = tendencyVO.getMinPreferredGenre();		
		VOForSearch.setBookGenre(minPrefferedGenre);
		BookVO bookInMinPrefferedGenre = tendencyService.selectOneByGenre(VOForSearch);
		mv.addObject("bookInMinPrefferedGenre", bookInMinPrefferedGenre);
	}
	//모든 사용자 선호장르 정보를 가져옴(ajax없는버전에서 사용했었음)
	public void getTotalTendency(TendencyServiceImpl tendencyService, ModelAndView mv) {
		TendencyVO tendencyVO = tendencyService.selectAllTendency();
		tendencyVO.setCustomerId("AllCustomer");
		tendencyVO.setElementToPercent();
		mv.addObject("totalTendency", tendencyVO);
	}
	
	public void addReviewPointToCustomerTendency(HttpSession session, TendencyVO tendencyVO, ReviewServiceImpl reviewService, BookServiceImpl bookService) {
		double scoreTotal [] = new double[6]; //art, social, economic, technology, literature, history 순으로
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		List<ReviewVO> reviewList = reviewService.selectReviewListByCustomerId(customerVO.getCustomerId()); //사용자의 리뷰리스트를 뽑아옴
		for(int i=0; i<reviewList.size(); i++) {
			BookVO bookVOForSearch = new BookVO();	//검색을 위한 객체
			bookVOForSearch.setBookId(reviewList.get(i).getBookId());	// 리뷰에 포함되어있는 bookId 세팅
			BookVO bookVOForgetGenre = bookService.selectBook(bookVOForSearch);	//// 리뷰에 포함되어있던 bookId로 검색
			String reviewGenre = bookVOForgetGenre.getBookGenre();
			switch(reviewGenre) {
			case "ART" : scoreTotal[0]+=reviewList.get(i).getBuyreviewScore()-2.5; //평점을 2.5점을 기준으로 5점을 주면 장르 성향 점수에 2.5점을 추가, 1점이면 -1.5점을 추가하는 방식
						 break;
			case "SOCIAL" : scoreTotal[1]+=reviewList.get(i).getBuyreviewScore()-2.5;
			 				break;
			case "ECONOMIC" : scoreTotal[2]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			case "TECHNOLOGY" : scoreTotal[3]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			case "LITERATURE" : scoreTotal[4]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			case "HISTORY" : scoreTotal[5]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			}
		}
		tendencyVO.setArt((int)(tendencyVO.getArt()+scoreTotal[0]));
		tendencyVO.setSocial((int)(tendencyVO.getSocial()+scoreTotal[1]));
		tendencyVO.setEconomic((int)(tendencyVO.getEconomic()+scoreTotal[2]));
		tendencyVO.setTechnology((int)(tendencyVO.getTechnology()+scoreTotal[3]));
		tendencyVO.setLiterature((int)(tendencyVO.getLiterature()+scoreTotal[4]));
		tendencyVO.setHistory((int)(tendencyVO.getHistory()+scoreTotal[5]));		
	}
	// 장르 성향그래프를 그릴 경우 모든 사용자의 장르 성향 점수에 리뷰점수를 추가시킴(평점 2.5를 기준으로 +-시킴)
	public void addReviewPointToAllUsersTendency(HttpSession session, TendencyVO tendencyVO, ReviewServiceImpl reviewService, BookServiceImpl bookService) {
		double scoreTotal [] = new double[6]; //art, social, economic, technology, literature, history 순으로
		
		List<ReviewVO> reviewList = reviewService.selectReviewList(); //모든사용자의 리뷰리스트를 뽑아옴
		for(int i=0; i<reviewList.size(); i++) {
			BookVO bookVOForSearch = new BookVO();	//검색을 위한 객체
			bookVOForSearch.setBookId(reviewList.get(i).getBookId());	// 리뷰에 포함되어있는 bookId 세팅
			BookVO bookVOForgetGenre = bookService.selectBook(bookVOForSearch);	//// 리뷰에 포함되어있던 bookId로 검색
			String reviewGenre = bookVOForgetGenre.getBookGenre();
			switch(reviewGenre) {
			case "ART" : scoreTotal[0]+=reviewList.get(i).getBuyreviewScore()-2.5; //평점을 2.5점을 기준으로 5점을 주면 장르 성향 점수에 2.5점을 추가, 1점이면 -1.5점을 추가하는 방식
						 break;
			case "SOCIAL" : scoreTotal[1]+=reviewList.get(i).getBuyreviewScore()-2.5;
			 				break;
			case "ECONOMIC" : scoreTotal[2]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			case "TECHNOLOGY" : scoreTotal[3]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			case "LITERATURE" : scoreTotal[4]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			case "HISTORY" : scoreTotal[5]+=reviewList.get(i).getBuyreviewScore()-2.5;
							break;
			}
		}
		tendencyVO.setArt((int)(tendencyVO.getArt()+scoreTotal[0]));
		tendencyVO.setSocial((int)(tendencyVO.getSocial()+scoreTotal[1]));
		tendencyVO.setEconomic((int)(tendencyVO.getEconomic()+scoreTotal[2]));
		tendencyVO.setTechnology((int)(tendencyVO.getTechnology()+scoreTotal[3]));
		tendencyVO.setLiterature((int)(tendencyVO.getLiterature()+scoreTotal[4]));
		tendencyVO.setHistory((int)(tendencyVO.getHistory()+scoreTotal[5]));		
	}
	
	public void checkTendencyPointInConsole(TendencyVO tendencyVO, String name ) {
		System.out.println(name + "의 성향 데이터");
		System.out.println("art : " + tendencyVO.getArt());
		System.out.println("economic : " + tendencyVO.getEconomic());
		System.out.println("history : " + tendencyVO.getHistory());
		System.out.println("literature : " + tendencyVO.getLiterature());
		System.out.println("social : " + tendencyVO.getSocial());
		System.out.println("technology : " + tendencyVO.getTechnology());
	}
}
