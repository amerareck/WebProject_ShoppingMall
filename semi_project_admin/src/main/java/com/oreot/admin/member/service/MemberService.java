package com.oreot.admin.member.service;

import java.util.List;

import com.oreot.admin.member.dao.MemberVO;

public interface MemberService { 
	
	// 전체 회원 조회
	List<MemberVO> getMemberList(MemberVO vo);
	
	// 회원 한명 조회
	MemberVO getMemberInfo(MemberVO vo);
	
	// 회원정보 수정
	void updateMember(MemberVO vo);
	
	// 회원 삭제
	void deleteMember(MemberVO vo);
}





 