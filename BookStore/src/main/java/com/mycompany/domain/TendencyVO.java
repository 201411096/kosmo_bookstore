package com.mycompany.domain;

public class TendencyVO {
	private int tendencyId;
	private String customerId;
	private int art;
	private int social;
	private int economic;
	private int technology;
	private int literature;
	private int history;
	
	public int getTendencyId() {
		return tendencyId;
	}
	public void setTendencyId(int tendencyId) {
		this.tendencyId = tendencyId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getArt() {
		return art;
	}
	public void setArt(int art) {
		this.art = art;
	}
	public int getSocial() {
		return social;
	}
	public void setSocial(int social) {
		this.social = social;
	}
	public int getEconomic() {
		return economic;
	}
	public void setEconomic(int economic) {
		this.economic = economic;
	}
	public int getTechnology() {
		return technology;
	}
	public void setTechnology(int technology) {
		this.technology = technology;
	}
	public int getLiterature() {
		return literature;
	}
	public void setLiterature(int literature) {
		this.literature = literature;
	}
	public int getHistory() {
		return history;
	}
	public void setHistory(int history) {
		this.history = history;
	}
	public void setElementToPercent() {
		int sum= this.art+this.economic+this.history+this.literature+this.social+this.technology;
		this.art= (int)(((double)this.art/sum)*100);
		this.economic= (int)(((double)this.economic/sum)*100);
		this.history= (int)(((double)this.history/sum)*100);
		this.literature= (int)(((double)this.literature/sum)*100);
		this.social= (int)(((double)this.social/sum)*100);
		this.technology= (int)(((double)this.technology/sum)*100);
	}
}
