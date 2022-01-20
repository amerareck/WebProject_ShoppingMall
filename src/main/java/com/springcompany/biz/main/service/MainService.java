package com.springcompany.biz.main.service;

import java.util.List;

import com.springcompany.biz.main.dao.MainVO;
import com.springcompany.biz.stock.dao.StockVO;
import com.springcompany.biz.user.dao.UserVO;

public interface MainService { // 이 정의 자체가 interface이기 때문에 모두 이름만 가지고 있는 추상메서드.
	// CRUD 기능의 메서드 구현
	
	// 회원 정보 받아오기
	MainVO getMemberInfo(String id);
	
	// 회원 정보 업데이트
	void updateMemberInfo(MainVO vo);
	
	// 회원 적립금 내역 받아오기
	List<MainVO> getMemberAccumulated(int num);
	
	// 회원 작성 리뷰리스트 받아오기
	List<StockVO> getMyReviewList(int num);
	
	// 회원 작성 QnA 리스트 받아오기
	List<MainVO> getMyQnaList(int num);
	
	// 회원 작성 QnA 상세보기
	MainVO getMyQna(int num);
	
	// QnA 공지사항 받아오기
	List<MainVO> getQnaNotice();
	
	// QnA 공지사항 상세보기
	MainVO getNotice(int num);
	
	// 회원 QnA 게시글 작성
	void insertQuestionBoard(MainVO vo);
	
	// Stockdata 받기
	List<MainVO>getStockList();
	// Categoriesdata 받기
//	List<StockVO>getCategoriesList(String name);
	
	// 세션 업데이트
	UserVO updateSession(UserVO member, MainVO vo);
	
	// 세션 정보 주입
	MainVO getSessionMemberInfo(MainVO vo, UserVO member);
//	
//	// 글 목록 조회
//	List<UserVO> getServiceList();
//	
//	// 글 상세 조회
//	UserVO getService(String id);
//	
//	// 글 수정
//	
//	// 글 삭제
//	void deleteService(int seq);
		
}





 