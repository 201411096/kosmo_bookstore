package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.dao.BuyListDAO;
import com.mycompany.domain.BuyListVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.service.BuyListServiceImpl;
import com.mycompany.service.BuyServiceImpl;

@Controller
public class BuyListController {
	
	@Autowired
	BuyListServiceImpl buyListService;
	@Autowired
	BuyServiceImpl buyService;
	
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
}
