package com.mycompany.domain;

public class BuyCartListVO {
	private int buycartlistId;
	private String customerId;
	private int bookId;
	private int buycartlistCnt;
	private String bookName;	
	private int bookPrice;
	private int bookSaleprice;
	private int bookTotalPrice;
	
	public int getBuycartlistId() {
		return buycartlistId;
	}
	public void setBuycartlistId(int buycartlistId) {
		this.buycartlistId = buycartlistId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getBuycartlistCnt() {
		return buycartlistCnt;
	}
	public void setBuycartlistCnt(int buycartlistCnt) {
		this.buycartlistCnt = buycartlistCnt;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public int getBookTotalPrice() {
		return bookTotalPrice;
	}
	public void setBookTotalPrice(int bookTotalPrice) {
		this.bookTotalPrice = bookTotalPrice;
	}
	public int getBookSaleprice() {
		return bookSaleprice;
	}
	public void setBookSaleprice(int bookSaleprice) {
		this.bookSaleprice = bookSaleprice;
	}
}
