package com.springcompany.biz.stock.dao;

import java.sql.Date;

public class StockVO {
	private int reviewGrade;	
	private String reviewContent;		
	private Date reviewDate;
	
	private int scategoriesNum;
	private String scategoriesName;
	
	private int stockNum;
	private int optionNum;
	private String memberId;
	private int memberNum;
	private String stockName;			
	private String stockPhoto;
	private String optionColor;
	private String optionSize;
	private int optionAmount;
	private int accumulatedMoney;
	private int stockPrice;
	private int basketAmount;
	private int basketNum;
	
	private String lcategoriesName;
	private int reviewNum; 			//리뷰개수
	private int lcategoriesNum;
	private String optionColorList;  //옵션 색상 종류
	private String stockInfo; 		//상품 상세 정보
	private String photoLocation;
	private int accmulatedMoney;
	
	@Override
	public String toString() {
		return "StockVO[stockName="+stockName+"memberId="+memberId+", stockPhoto="+stockPhoto+", optionNum="+optionNum+", optionColor="+optionColor+", optionSize="+optionSize+", optionAmount="+optionAmount+
				"\n, accumulatedMoney="+accumulatedMoney+", stockPrice="+stockPrice+", basketAmount="+basketAmount+", memberNum="+memberNum+", basketNum="+basketNum+
				"\n, reviewGrade="+reviewGrade+", reviewContent="+reviewContent+", reviewDate="+reviewDate+"]";
	}
	
	public int getStockNum() {
		return stockNum;
	}

	public void setStockNum(int stockNum) {
		this.stockNum = stockNum;
	}

	public int getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public int getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	
	public int getScategoriesNum() {
		return scategoriesNum;
	}

	public void setScategoriesNum(int scategoriesNum) {
		this.scategoriesNum = scategoriesNum;
	}

	public String getScategoriesName() {
		return scategoriesName;
	}

	public void setScategoriesName(String scategoriesName) {
		this.scategoriesName = scategoriesName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getStockPhoto() {
		return stockPhoto;
	}

	public void setStockPhoto(String stockPhoto) {
		this.stockPhoto = stockPhoto;
	}

	public String getOptionColor() {
		return optionColor;
	}

	public void setOptionColor(String optionColor) {
		this.optionColor = optionColor;
	}

	public String getOptionSize() {
		return optionSize;
	}

	public void setOptionSize(String optionSize) {
		this.optionSize = optionSize;
	}

	public int getOptionAmount() {
		return optionAmount;
	}

	public void setOptionAmount(int optionAmount) {
		this.optionAmount = optionAmount;
	}

	public int getAccumulatedMoney() {
		return accumulatedMoney;
	}

	public void setAccumulatedMoney(int accumulatedMoney) {
		this.accumulatedMoney = accumulatedMoney;
	}

	public int getStockPrice() {
		return stockPrice;
	}

	public void setStockPrice(int stockPrice) {
		this.stockPrice = stockPrice;
	}

	public int getBasketAmount() {
		return basketAmount;
	}

	public void setBasketAmount(int basketAmount) {
		this.basketAmount = basketAmount;
	}

	public int getBasketNum() {
		return basketNum;
	}

	public void setBasketNum(int basketNum) {
		this.basketNum = basketNum;
	}

	public String getLcategoriesName() {
		return lcategoriesName;
	}

	public void setLcategoriesName(String lcategoriesName) {
		this.lcategoriesName = lcategoriesName;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getLcategoriesNum() {
		return lcategoriesNum;
	}

	public void setLcategoriesNum(int lcategoriesNum) {
		this.lcategoriesNum = lcategoriesNum;
	}

	public String getOptionColorList() {
		return optionColorList;
	}

	public void setOptionColorList(String optionColorList) {
		this.optionColorList = optionColorList;
	}

	public String getStockInfo() {
		return stockInfo;
	}

	public void setStockInfo(String stockInfo) {
		this.stockInfo = stockInfo;
	}

	public String getPhotoLocation() {
		return photoLocation;
	}

	public void setPhotoLocation(String photoLocation) {
		this.photoLocation = photoLocation;
	}

	public int getAccmulatedMoney() {
		return accmulatedMoney;
	}

	public void setAccmulatedMoney(int accmulatedMoney) {
		this.accmulatedMoney = accmulatedMoney;
	}
	
	
	
}
