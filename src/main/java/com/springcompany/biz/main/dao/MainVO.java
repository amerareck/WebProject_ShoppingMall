package com.springcompany.biz.main.dao;

import java.sql.Date;

public class MainVO {
	// ----> 멤버 세션 참조형
	private String memberId;
	private String memberPass;
	private String memberName;
	private String memberEmail;
	private String memberTel;
	private String memberBirth;
	private String year, month, day;
	private int memberNum;
	
	// ----> 멤버 적립금 조회 참조형
	private String accumulatedHistory;
	private int accumulatedMoney;
	private String accumulatedUse;
	private Date accumulatedDate;
	
	// ----> QnA 참조형
	private int stockNum; // 상품코드 검색창을 만들어서 사용자가 스톡넘버를 넘기게끔 해야할 듯?
	private String stockName;
	private int inquireNum;
	private String inquireTitle;
	private String inquireContent;
	private Date inquireDate;
	private Date inquireModifyDate;
	private String replyStatus;
	private String replyContent;
	private Date replyDate;
	
	private int noticeNum;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	
	@Override
	public String toString() {
		return "[memberNum : "+memberNum+", memberId : "+memberId+", memberPass : "+memberPass+", memberName : "+memberName+
				", memberEmail : "+memberEmail+", memberTel : "+memberTel+", memberBirth : "+memberBirth+", year : "+year+", month : "+month+", day : "+day+
				",\n accumulatedHistory : "+accumulatedHistory+", accumulatedMoney : "+accumulatedMoney+", accumulatedUse : "+accumulatedUse+", accumulatedDate : "+accumulatedDate+
				", inquireTitle : "+inquireTitle+", inquireContent : "+inquireContent+", inquireDate : "+inquireDate+", inquireModifyDate : "+inquireModifyDate+", replyStatus : "+replyStatus
				+", replyContent : "+replyContent+"]";
	}
	
	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPass() {
		return memberPass;
	}


	public void setMemberPass(String memberPass) {
		this.memberPass = memberPass;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberTel() {
		return memberTel;
	}


	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}


	public String getMemberBirth() {
		return memberBirth;
	}


	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}


	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getMemberNum() {
		return memberNum;
	}


	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}


	public String getAccumulatedHistory() {
		return accumulatedHistory;
	}


	public void setAccumulatedHistory(String accumulatedHistory) {
		this.accumulatedHistory = accumulatedHistory;
	}


	public int getAccumulatedMoney() {
		return accumulatedMoney;
	}


	public void setAccumulatedMoney(int accumulatedMoney) {
		this.accumulatedMoney = accumulatedMoney;
	}


	public String getAccumulatedUse() {
		return accumulatedUse;
	}


	public void setAccumulatedUse(String accumulatedUse) {
		this.accumulatedUse = accumulatedUse;
	}


	public Date getAccumulatedDate() {
		return accumulatedDate;
	}


	public void setAccumulatedDate(Date accumulatedDate) {
		this.accumulatedDate = accumulatedDate;
	}


	public String getInquireTitle() {
		return inquireTitle;
	}


	public void setInquireTitle(String inquireTitle) {
		this.inquireTitle = inquireTitle;
	}


	public Date getInquireDate() {
		return inquireDate;
	}


	public void setInquireDate(Date inquireDate) {
		this.inquireDate = inquireDate;
	}


	public String getReplyStatus() {
		return replyStatus;
	}


	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}


	public String getInquireContent() {
		return inquireContent;
	}


	public void setInquireContent(String inquireContent) {
		this.inquireContent = inquireContent;
	}


	public Date getInquireModifyDate() {
		return inquireModifyDate;
	}


	public void setInquireModifyDate(Date inquireModifyDate) {
		this.inquireModifyDate = inquireModifyDate;
	}

	
	public int getStockNum() {
		return stockNum;
	}


	public void setStockNum(int stockNum) {
		this.stockNum = stockNum;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getInquireNum() {
		return inquireNum;
	}

	public void setInquireNum(int inquireNum) {
		this.inquireNum = inquireNum;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}	
	
}
