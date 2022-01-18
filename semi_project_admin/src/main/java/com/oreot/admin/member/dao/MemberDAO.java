package com.oreot.admin.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	// 전체 회원 조회
	public List<MemberVO> getMemberList(MemberVO vo){
		if(vo.getSearchCondition().equals("memberId")) {
			return mybatis.selectList("Member.getMemberList_I", vo);
		}else if(vo.getSearchCondition().equals("memberName")) {
			return mybatis.selectList("Member.getMemberList_N", vo);
		}else { // 디폴트는 제목, 즉 TITLE로.
			return mybatis.selectList("Member.getMemberList_I", vo);
		}
	}
		
	// 회원 한명 조회
	public MemberVO getMemberInfo(MemberVO vo) {
		return mybatis.selectOne("Member.getMemberInfo",vo);
	}
	
	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		mybatis.update("Member.updateMember", vo); 
	}
	
	// 회원 삭제
	public void deleteMember(MemberVO vo) {
		mybatis.delete("Member.deleteMember", vo); 
	}
}
