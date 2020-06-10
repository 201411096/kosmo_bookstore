package com.mycompany.util;

public class Sales {
	private static Sales instance = null;
	private static String salesOptions [] = {"YY", "YYMM", "YYMMDD", "YYMMDDHH24", "YYMMDDHH24MI", "YYMMDDHH24MISS"};
	private Sales() {}
	public static Sales getInstance() {
		if(instance==null) {
			instance = new Sales();
		}
		return instance;
	}
	public String changeIntOptionToString(int option) {
		return salesOptions[option];
	}
}
