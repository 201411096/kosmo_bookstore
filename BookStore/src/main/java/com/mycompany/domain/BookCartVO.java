package com.mycompany.domain;

public class BookCartVO {
	private int bookId;
	private String bookName;
	private int bookCnt;
	private int bookPrice;
	private int bookTotalPrice;
	
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
	public int getBookCnt() {
		return bookCnt;
	}
	public void setBookCnt(int bookCnt) {
		this.bookCnt = bookCnt;
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
}
