package com.springcompany.biz.user.dao;

import java.sql.Date;

public class UserVO {
//	private String id;			
//	private String password;	
//	private String name;		
//	private String role;
	
	private int memberNum;
	private String memberName;
	private String memberId;
	private String memberPass;
	private String memberEmail;
	private String memberBirth;
	private String memberAddress;
	private String memberAgree;
	private Date memberDate;
	private String memberTel;
	
	private String year, month, day;
	
	// 회원 관심상품, 장바구니 정보
	private int memberInterItem;
	private int memberBasketNum;
	
	@Override
	public String toString() {
		return "UserVO[memberNum="+memberNum+", memberName="+memberName+", memberId="+memberId+", memberPass="+memberPass+", memberEmail="+memberEmail+", memberBirth="+memberBirth+", memberAddress="+memberAddress+", memberAgree="+memberAgree+", memberDate="+memberDate+", memberTel="+memberTel
				+"memberInterItem="+memberInterItem+"memberBasketNum"+memberBasketNum+"]";
	}
	
	public int getMemberInterItem() {
		return memberInterItem;
	}
	
	public void setMemberInterItem(int memberInterItem) {
		this.memberInterItem = memberInterItem;
	}
	
	public int getMemberBasketNum() {
		return memberBasketNum;
	}

	public void setMemberBasketNum(int memberBasketNum) {
		this.memberBasketNum = memberBasketNum;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberAgree() {
		return memberAgree;
	}
	public void setMemberAgree(String memberAgree) {
		this.memberAgree = memberAgree;
	}
	public Date getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
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
	


/*	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "UserVO[id="+id+", password="+password+", name="+name+", role="+role+"]";
	}
*/	
	
	
	
}
