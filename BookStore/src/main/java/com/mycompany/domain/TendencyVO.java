package com.mycompany.domain;

import java.util.ArrayList;

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
	public String getMaxPreferredGenre() {
		int cnt [] = new int[6];
		int max_idx=0;
		ArrayList<String> genre = new ArrayList<String>();
		cnt[0] = this.art;
		cnt[1] = this.economic;
		cnt[2] = this.history;
		cnt[3] = this.literature;
		cnt[4] = this.social;
		cnt[5] = this.technology;
		
		genre.add("ART");
		genre.add("ECONOMIC");
		genre.add("HISTORY");
		genre.add("LITERATURE");
		genre.add("SOCIAL");
		genre.add("TECHNOLOGY");

		for(int i=0; i<cnt.length; i++) {
			if(cnt[i]>cnt[max_idx])
				max_idx=i;
		}
		return genre.get(max_idx);
	}
	public String getMinPreferredGenre() {
		int cnt [] = new int[6];
		int min_idx=0;
		ArrayList<String> genre = new ArrayList<String>();
		cnt[0] = this.art;
		cnt[1] = this.economic;
		cnt[2] = this.history;
		cnt[3] = this.literature;
		cnt[4] = this.social;
		cnt[5] = this.technology;
		
		genre.add("ART");
		genre.add("ECONOMIC");
		genre.add("HISTORY");
		genre.add("LITERATURE");
		genre.add("SOCIAL");
		genre.add("TECHNOLOGY");

		for(int i=0; i<cnt.length; i++) {
			if(cnt[i]<cnt[min_idx])
				min_idx=i;
		}
		return genre.get(min_idx);
	}
	
	public String getMaxPrefferedGenreConsiderWithSameScore() {
		int cnt [] = new int[6];
		int max_idx=0;
		ArrayList<Integer> max_idx_arrayList = new ArrayList<Integer>();
		ArrayList<String> genre = new ArrayList<String>();
		cnt[0] = this.art;
		cnt[1] = this.economic;
		cnt[2] = this.history;
		cnt[3] = this.literature;
		cnt[4] = this.social;
		cnt[5] = this.technology;
		
		genre.add("ART");
		genre.add("ECONOMIC");
		genre.add("HISTORY");
		genre.add("LITERATURE");
		genre.add("SOCIAL");
		genre.add("TECHNOLOGY");

		for(int i=0; i<cnt.length; i++) {
			if(cnt[i]>cnt[max_idx]) {
				max_idx=i;
				max_idx_arrayList.clear();	// 기존에 동점인 장르들을 모아두던 arrayList 초기화
			}
				
			else if(cnt[i]==cnt[max_idx]) {
				max_idx_arrayList.add(i); // 장르의 점수가 똑같다면 arrayList에 추가
				if(max_idx_arrayList.size()==1  && max_idx!=i)
					max_idx_arrayList.add(max_idx); // 장르의 점수가 똑같으며 사이즈가 하나라면 max_idx도 추가 ==> 두개 이상일 경우에는 이미 max_idx가 들어가 있는 상태임
			}
		}
		if(max_idx_arrayList.size()>=2) {
			int random_idx = (int)(Math.random()*max_idx_arrayList.size());
			return genre.get(random_idx);
		}
		return genre.get(max_idx);
	}
	public String getMinPrefferedGenreConsiderWithSameScore() {
		int cnt [] = new int[6];
		int min_idx=0;
		ArrayList<Integer> min_idx_arrayList = new ArrayList<Integer>();
		ArrayList<String> genre = new ArrayList<String>();
		cnt[0] = this.art;
		cnt[1] = this.economic;
		cnt[2] = this.history;
		cnt[3] = this.literature;
		cnt[4] = this.social;
		cnt[5] = this.technology;
		
		genre.add("ART");
		genre.add("ECONOMIC");
		genre.add("HISTORY");
		genre.add("LITERATURE");
		genre.add("SOCIAL");
		genre.add("TECHNOLOGY");

		for(int i=0; i<cnt.length; i++) {
			if(cnt[i]<cnt[min_idx]) {
				min_idx=i;
				min_idx_arrayList.clear();	// 기존에 동점인 장르들을 모아두던 arrayList 초기화
			}
				
			else if(cnt[i]==cnt[min_idx]) {
				min_idx_arrayList.add(i); // 장르의 점수가 똑같다면 arrayList에 추가
				if(min_idx_arrayList.size()==1 && min_idx!=i)
					min_idx_arrayList.add(min_idx); // 장르의 점수가 똑같으며 사이즈가 하나라면 max_idx도 추가 ==> 두개 이상일 경우에는 이미 max_idx가 들어가 있는 상태임
			}
		}
		if(min_idx_arrayList.size()>=2) {
			int random_idx = (int)(Math.random()*min_idx_arrayList.size());
			return genre.get(random_idx);
		}
		return genre.get(min_idx);
	}
	
}
