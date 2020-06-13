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

import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;
import com.mycompany.service.BuyListServiceImpl;
import com.mycompany.service.BuyServiceImpl;
import com.mycompany.service.ReviewServiceImpl;

@Controller
public class BuyListController {
	private static final Logger logger = LoggerFactory.getLogger(BuyListController.class);
	@Autowired
	BuyListServiceImpl buyListService;
	@Autowired
	BuyServiceImpl buyService;
	@Autowired
	ReviewServiceImpl reviewService;
	
	/* 
	 * 함수 이름 : getReceiptList
	 * 주요 기능 : 영수증 목록을 반환
	 * 함수 내용
	 * 		ㄴ 사용자의 정보를 세션에서 가져와서 현재 로그인한 사용자의 영수증 목록을 끌어옴
	 * 		ㄴ 영수증 번호와 구매날짜를 담음 (receiptList, receiptListSize)
	 * 		ㄴ 영수증의 개수만큼 해당 영수증에 해당하는 구매내역들을 불러옴
	 * 			ㄴ 해당 영수증에 해당하는 구매내역들의 총합( totalPriceList )과 구매내역의 크기가 2이상이라면 영수증 이름을 수정해서 담아줌 (productListNameInReceiptList)
	 * 				ㄴ 1개일 경우 ( 오래된 비밀 )
	 * 				ㄴ 3개일 경우 ( 오래된 비밀 외 3종)
	 * 사용하는 Mapper : BuyListMapper.xml -> getBuyListByCustomerId
	 * 				  BuyMapper.xml -> selectAllBuyByBuyListId
	 * 반환되는 위치 : custom_receiptList.js
	 */
	@ResponseBody
	@RequestMapping(value = "/getReceiptList",  produces = "application/json; charset=utf-8")
	public Map getReceiptList(HttpSession session) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO) session.getAttribute("customer");
		List<BuyListVO> receiptList = buyListService.getBuyListByCustomerId(customerVO.getCustomerId());
		String productListNameInReceiptList[]; //물품 리스트를 담을..
		int totalPriceList[]; //가격 총합을 담을..
		if (receiptList.size() > 0) {
			productListNameInReceiptList = new String[receiptList.size()];
			totalPriceList = new int[receiptList.size()];
			result.put("receiptList", receiptList); // 영수증번호와 구매날짜를 보내줌
			for (int i = 0; i < receiptList.size(); i++) { // 영수증의 개수만큼 해당 영수증에 해당하는 구매내역들을 불러옴( 구매 물품의 종류와 구매가격 총합을 구할 부분 )
				List<Map> productListInReceipt =  buyService.selectAllBuyByBuyListId(receiptList.get(i).getBuylistId());
				int totalPrice=0;
				for(int j=0; j<productListInReceipt.size(); j++) {
					totalPrice += Integer.parseInt(String.valueOf(productListInReceipt.get(j).get("BOOKSALEPRICE"))) * Integer.parseInt(String.valueOf(productListInReceipt.get(j).get("BUYCNT")))  ;
				}
				totalPriceList[i]=totalPrice;
				if(productListInReceipt.size()>1) {
					productListNameInReceiptList[i]=(String)productListInReceipt.get(0).get("BOOKNAME")+" 외 " + Integer.toString(productListInReceipt.size()-1) + "종" ;	
				}else if(productListInReceipt.size()==1) {
					productListNameInReceiptList[i]=(String)productListInReceipt.get(0).get("BOOKNAME")+"";
				}
			}
			result.put("receiptListSize", receiptList.size());
			result.put("productListNameInReceiptList", productListNameInReceiptList);
			result.put("totalPriceList", totalPriceList);
		}
		return result;
	}
	
	/* 
	 * 함수 이름 : getReceipt
	 * 주요 기능 : 영수증 하나에 속해있는 구매내역을 반환
	 * 함수 내용 : buyListId를 넘겨받아 해당 영수증에 해당하는 구매내역을 반환
	 * 		ㄴ buyListId에 해당하는 구매내역을 가져옴
	 * 		ㄴ 사용자의 리뷰내역을 가져와서 구매한 내역에 해당하는 도서에 리뷰를 달았는지 달지 않았는지 체크해서 같이 보냄 (writeReviewFlagArray)
	 * 사용하는 Mapper : BuyMapper.xml -> selectAllBuyByBuyListId
	 * 				  ReviewMapper.xml -> selectReviewByCustomerId
	 * 반환되는 위치 : custom_receipt.js
	 */
	@ResponseBody
	@RequestMapping(value = "/getReceipt",  produces = "application/json; charset=utf-8")
	public Map getReceipt(HttpSession session, @RequestParam("buylistId") String buylistId) {
		Map result = new HashMap();
		CustomerVO customerVO = (CustomerVO)session.getAttribute("customer");
		List<Map> buyList = buyService.selectAllBuyByBuyListId(Integer.parseInt(buylistId));
		int writeReviewFlagArray []; // 구매한 책에 대해서 리뷰를 작성했는지 안했는지.. 1이면 이미 작성함, 0이면 작성하지 않음 
		if(buyList.size()>=1)
		{
			writeReviewFlagArray = new int [buyList.size()];
			List<ReviewVO> reviewList = reviewService.selectReviewListByCustomerId(customerVO.getCustomerId());
			for(int i=0; i<buyList.size(); i++) {
				for(int j=0; j<reviewList.size(); j++) {
					if(Integer.parseInt(String.valueOf(buyList.get(i).get("BOOKID")))==(reviewList.get(j).getBookId()))
						writeReviewFlagArray[i]=1; // 구매한 도서에 대한 리뷰를 이미 작성함
				}
			}
			result.put("writeReviewFlagArray", writeReviewFlagArray);
			result.put("buyList", buyList);
			result.put("buyListSize", buyList.size());
		}		
		return result;
	}
}
