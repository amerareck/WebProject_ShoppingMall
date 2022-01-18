package com.oreot.admin.stock.dao;

import org.springframework.web.multipart.MultipartFile;

public class StockVO {
	private String stockNum;	
	private String stockCode;
	private String stockName;
	private String stockPhoto;	
	private String stockPrice;
	private String stockInfo;
	private String stockDate;
	private String scategoriesNum;
	private String scategoriesName;
	private String lcategoriesNum;
	private String lcategoriesName;
	private String optionNum;
	private String optionSize;
	private String optionColor;
	private String optionAmount;
	private String totalAmount;
	private String photoNum;
	private String photoLocation;
	private String checkStockCode;
	private String countingStockNum;
	private MultipartFile uploadFile;
	
	public String getCountingStockNum() {
		return countingStockNum;
	}
	public void setCountingStockNum(String countingStockNum) {
		this.countingStockNum = countingStockNum;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getCheckStockCode() {
		return checkStockCode;
	}
	public void setCheckStockCode(String checkStockCode) {
		this.checkStockCode = checkStockCode;
	}
	public String getStockNum() {
		return stockNum;
	}
	public void setStockNum(String stockNum) {
		this.stockNum = stockNum;
	}
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getStockPhoto() {
		return stockPhoto;
	}
	public void setStockPhoto(String stockPhoto) {
		this.stockPhoto = stockPhoto;
	}
	public String getStockPrice() {
		return stockPrice;
	}
	public void setStockPrice(String stockPrice) {
		this.stockPrice = stockPrice;
	}
	public String getStockInfo() {
		return stockInfo;
	}
	public void setStockInfo(String stockInfo) {
		this.stockInfo = stockInfo;
	}
	public String getStockDate() {
		return stockDate;
	}
	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}
	public String getScategoriesNum() {
		return scategoriesNum;
	}
	public void setScategoriesNum(String scategoriesNum) {
		this.scategoriesNum = scategoriesNum;
	}
	public String getScategoriesName() {
		return scategoriesName;
	}
	public void setScategoriesName(String scategoriesName) {
		this.scategoriesName = scategoriesName;
	}
	public String getLcategoriesNum() {
		return lcategoriesNum;
	}
	public void setLcategoriesNum(String lcategoriesNum) {
		this.lcategoriesNum = lcategoriesNum;
	}
	public String getLcategoriesName() {
		return lcategoriesName;
	}
	public void setLcategoriesName(String lcategoriesName) {
		this.lcategoriesName = lcategoriesName;
	}
	public String getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(String optionNum) {
		this.optionNum = optionNum;
	}
	public String getOptionSize() {
		return optionSize;
	}
	public void setOptionSize(String optionSize) {
		this.optionSize = optionSize;
	}
	public String getOptionColor() {
		return optionColor;
	}
	public void setOptionColor(String optionColor) {
		this.optionColor = optionColor;
	}
	public String getOptionAmount() {
		return optionAmount;
	}
	public void setOptionAmount(String optionAmount) {
		this.optionAmount = optionAmount;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(String photoNum) {
		this.photoNum = photoNum;
	}
	public String getPhotoLocation() {
		return photoLocation;
	}
	public void setPhotoLocation(String photoLocation) {
		this.photoLocation = photoLocation;
	}
	
	
	
}
