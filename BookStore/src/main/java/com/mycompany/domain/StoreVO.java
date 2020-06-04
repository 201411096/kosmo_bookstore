package com.mycompany.domain;

public class StoreVO {
	private int storeId;
	private String storeName;
	private String storeAddr;
	private String storeTel;
	private String storePoint;
	
	public String getStorePoint() {
		return storePoint;
	}
	public void setStorePoint(String storePoint) {
		this.storePoint = storePoint;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
	public String getStoreTel() {
		return storeTel;
	}
	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}
}
