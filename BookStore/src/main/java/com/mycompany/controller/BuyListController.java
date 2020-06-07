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

import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.ReviewVO;
import com.mycompany.service.BuyListServiceImpl;
import com.mycompany.service.BuyServiceImpl;
import com.mycompany.service.ReviewServiceImpl;

@Controller
public class BuyListController {
	
	@Autowired
	BuyListServiceImpl buyListService;
	@Autowired
	BuyServiceImpl buyService;
	@Autowired
	ReviewServiceImpl reviewService;
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
			result.put("receiptList", receiptList); // 구매번호와 구매날짜를 보내줌
			for (int i = 0; i < receiptList.size(); i++) { // 구매 물품의 종류와 구매가격 총합을 구할 부분
				List<Map> productListInReceipt =  buyService.selectAllBuyByBuyListId(receiptList.get(i).getBuylistId());
				System.out.println("productListInReceipt확인 " + productListInReceipt);
				System.out.println("productListInReceipt size확인 " + productListInReceipt.size());
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
			System.out.println("receiptListSize 확인 : " + receiptList.size());
			for(int i=0; i<productListNameInReceiptList.length; i++)
				System.out.println("productListNameInReceiptList 확인 " + productListNameInReceiptList[i]);
			for(int i=0; i<totalPriceList.length; i++)
				System.out.println("totalPriceList : " + totalPriceList[i]);

		}
		return result;
	}
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
