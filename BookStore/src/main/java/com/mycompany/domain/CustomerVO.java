package com.mycompany.domain;

public class CustomerVO {
	private String customerId;
	private String customerPassword;
	private String customerName;
	private String customerTel;
	private int customerPoint;
	private int customerFlag;
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerPassword() {
		return customerPassword;
	}
	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerTel() {
		return customerTel;
	}
	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}
	public int getCustomerPoint() {
		return customerPoint;
	}
	public void setCustomerPoint(int customerPoint) {
		this.customerPoint = customerPoint;
	}
	public int getCustomerFlag() {
		return customerFlag;
	}
	public void setCustomerFlag(int customerFlag) {
		this.customerFlag = customerFlag;
	}
}
