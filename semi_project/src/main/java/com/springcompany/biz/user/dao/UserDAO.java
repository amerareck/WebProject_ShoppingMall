package com.springcompany.biz.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//	public UserVO getBoard(String memberId) {
//		return mybatis.selectOne("UserDAO.getBoard", memberId);
//	}
	public UserVO getMemberInfo(String id) {
		return mybatis.selectOne("userDAO.getMemberInfo", id);
	}
	
	public void signup(UserVO vo) {
		mybatis.insert("userDAO.signup", vo);
		System.out.println("DB COMPLETE");
	}
	
	public UserVO getBasketNum(int number) {
		return mybatis.selectOne("userDAO.getBasketNum", number);
	}
	
//	@Autowired
//	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
//		super.setSqlSessionFactory(sqlSessionFactory);
//	}
	
//	@Autowired
//	private JdbcTemplate jdbcTemplate;
	
//	private final String USER_OBJECT = "select * from members where memberNum=?";

//	public UserVO getObject(String memberId) {
//		Object[] args = {memberId};
//		return jdbcTemplate.queryForObject(USER_OBJECT, args , new UserRowMapper());
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
//}

