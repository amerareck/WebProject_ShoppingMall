package com.springcompany.biz.main.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springcompany.biz.stock.dao.StockVO;
import com.springcompany.biz.user.dao.UserVO;


@Repository
public class MainDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void updateMemberInfo(UserVO vo) {
		System.out.println("updateMemberInfo 호출");
		System.out.println(vo);
		mybatis.update("MainDAO.updateMemberInfo", vo);
	}
	
	public MainVO getMemberInfo(String id) {
		System.out.println("getMemberInfo 호출");
		return mybatis.selectOne("MainDAO.getMemberInfo", id);
	}
	
	public List<MainVO> getMemberAccumulated(int num) {
		System.out.println("getMemberAccumulated 호출");
		return mybatis.selectList("MainDAO.getMemberAccumulated", num);
	}
	
	public List<StockVO> getMyReviewList(int num) {
		System.out.println("getMyReviewList 호출");
		return mybatis.selectList("MainDAO.getMyReviewList", num);
	}
	
	public List<MainVO> getMyQnaList(int num) {
		System.out.println("getMyQnaList 호출");
		return mybatis.selectList("MainDAO.getMyQnaList", num);
	}
	
	public void insertQuestionBoard(MainVO vo) {
		System.out.println("insertQuestionBoard 호출");
		mybatis.insert("MainDAO.insertQuestionBoard", vo);
	}
	
	public List<MainVO> getQnaNotice() {
		System.out.println("getQnaNotice 호출");
		return mybatis.selectList("MainDAO.getQnaNotice");
	}
	
	public MainVO getMyQna(int inquireNum) {
		System.out.println("getMyQna 호출");
		return mybatis.selectOne("MainDAO.getMyQna", inquireNum);
	}
	
	public MainVO getNotice(int noticeNum) {
		System.out.println("getNotice 호출");
		return mybatis.selectOne("MainDAO.getNoitce", noticeNum);
	}
	
//	public List<StockVO> getCategoriesList(String name) {
//		return mybatis.selectList("MainDAO.getStockList", name);
//	}
	
	public List<MainVO> getStockList() {
		return mybatis.selectList("MainDAO.getStockList");
	}
//	// CRUD 기능의 메서드 구현
//	// 글 등록
//	public void insertBoard(BoardVO vo) {
//		mybatis.insert("BoardDAO.insertBoard", vo); // Namespace이름인 BoardDAO. 다음 id인 insertBoard의 용도.
//	}
//
//	// 글 목록 조회
//	public List<BoardVO> getBoardList(BoardVO vo){
//		
//		if(vo.getSearchCondition().equals("TITLE")) {
//			return mybatis.selectList("BoardDAO.getBoardList_T", vo);
//		}else if(vo.getSearchCondition().equals("CONTENT")) {
//			return mybatis.selectList("BoardDAO.getBoardList_C", vo);
//		}else { // 디폴트는 제목, 즉 TITLE로.
//			return mybatis.selectList("BoardDAO.getBoardList_T", vo);
//		}
//		
//	}
//	
//	// 글 상세 조회
//	public BoardVO getBoard(int seq) {
//		return mybatis.selectOne("BoardDAO.getBoard", seq);
//	}
//	
//	// 글 수정
//	public void updateBoard(BoardVO vo) {
//		mybatis.update("BoardDAO.updateBoard", vo); 
//	}
//	
//	// 글 삭제
//	public void deleteBoard(int seq) {
//		mybatis.delete("BoardDAO.deleteBoard", seq); 
//	}
	
}

