package com.mycompany.domain;

public class BookVO {
	private int bookId;
	private int writerId;
	private String writerName;
	private int bookPrice;
	private String bookName;
	private String bookGenre;
	private String bookStory;
	private String bookPdate;
	private int bookSaleprice;
	private int bookCnt;
	private double bookScore;
	private int bookScorecount;
	private double bookScoreDivideByCount;

	public double getBookScoreDivideByCount() {
		return bookScoreDivideByCount;
	}

	public void setBookScoreDivideByCount(double bookScoreDivideByCount) {
		this.bookScoreDivideByCount = bookScoreDivideByCount;
	}

	public int getBookScorecount() {
		return bookScorecount;
	}

	public void setBookScorecount(int bookScorecount) {
		this.bookScorecount = bookScorecount;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookGenre() {
		return bookGenre;
	}

	public void setBookGenre(String bookGenre) {
		this.bookGenre = bookGenre;
	}

	public String getBookStory() {
		return bookStory;
	}

	public void setBookStory(String bookStory) {
		this.bookStory = bookStory;
	}

	public String getBookPdate() {
		return bookPdate;
	}

	public void setBookPdate(String bookPdate) {
		this.bookPdate = bookPdate;
	}

	public int getBookSaleprice() {
		return bookSaleprice;
	}

	public void setBookSaleprice(int bookSaleprice) {
		this.bookSaleprice = bookSaleprice;
	}

	public int getBookCnt() {
		return bookCnt;
	}

	public void setBookCnt(int bookCnt) {
		this.bookCnt = bookCnt;
	}

	public double getBookScore() {
		return bookScore;
	}

	public void setBookScore(double bookScore) {
		this.bookScore = bookScore;
	}

}