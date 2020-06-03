package com.mycompany.domain;

public class ReviewVO {
	
	private int buyreviewId;
	private String customerId;
	private int bookId;
	private String buyreviewContent;
	private int buyreviewScore;
	public int getBuyreviewId() {
		return buyreviewId;
	}
	public void setBuyreviewId(int buyreviewId) {
		this.buyreviewId = buyreviewId;
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
	public String getBuyreviewContent() {
		return buyreviewContent;
	}
	public void setBuyreviewContent(String buyreviewContent) {
		this.buyreviewContent = buyreviewContent;
	}
	public int getBuyreviewScore() {
		return buyreviewScore;
	}
	public void setBuyreviewScore(int buyreviewScore) {
		this.buyreviewScore = buyreviewScore;
	}

}
