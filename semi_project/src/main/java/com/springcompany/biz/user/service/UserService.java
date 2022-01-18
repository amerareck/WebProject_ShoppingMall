package com.springcompany.biz.user.service;

import com.springcompany.biz.user.dao.UserVO;

public interface UserService { // 이 정의 자체가 interface이기 때문에 모두 이름만 가지고 있는 추상메서드.
	// CRUD 기능의 메서드 구현
	
	// 회원가입
	public void signup(UserVO vo) throws Exception;

	// 로그인
	UserVO getMemberInfo(String id);
	
	// 바스켓받기
	UserVO getBasketNum(int number);
		
}





 