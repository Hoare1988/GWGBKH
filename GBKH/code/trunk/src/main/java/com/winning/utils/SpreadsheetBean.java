package com.winning.utils;

import java.util.List;

public class SpreadsheetBean {

	private String sheetName;
	private String[] titles;
	private List<Object[]> dataList;
	
	public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
	public String[] getTitles() {
		return titles;
	}
	public void setTitles(String[] titles) {
		this.titles = titles;
	}
	public List<Object[]> getDataList() {
		return dataList;
	}
	public void setDataList(List<Object[]> dataList) {
		this.dataList = dataList;
	}
}
