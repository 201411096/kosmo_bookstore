package com.mycompany.domain;

public class BuyListVO {

	private int buylistId;
	private String customerId;
	private String buyDate;
	private String buylistShippingadderess;
	
	private String postCode;
	private String addr;
	private String detailAddr;
	
	public String getBuylistShippingadderess() {
		return buylistShippingadderess;
	}
	public void setBuylistShippingadderess(String buylistShippingadderess) {
		this.buylistShippingadderess = buylistShippingadderess;
	}
	public int getBuylistId() {
		return buylistId;
	}
	public void setBuylistId(int buylistId) {
		this.buylistId = buylistId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	
	
}
