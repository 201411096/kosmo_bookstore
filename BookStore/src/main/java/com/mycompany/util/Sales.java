package com.mycompany.util;

public class Sales {
	private static Sales instance = null;
	private static String salesOptions [] = {"YY", "YY/MM", "YY/MM/DD", "YY/MM/DD/HH24", "YY/MM/DD/HH24:MI", "YY/MM/DD/HH24:MI:SS"};
	private static int getChartCnt [] = {10, 12, 30, 24, 60, 60};	//사용하지 않음
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
	//사용하지 않음
	public int getChartCnt(int option) {
		return getChartCnt[option];
	}
}
