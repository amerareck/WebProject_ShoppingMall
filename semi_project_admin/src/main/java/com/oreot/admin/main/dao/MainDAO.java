package com.oreot.admin.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public MainVO getAdminIdPw() {
		return mybatis.selectOne("Main.getAdminIdPw");
	}
	
	public MainVO getAdminInfo(String memberId) {
		return mybatis.selectOne("Main.getAdminInfo",memberId);
	}
	
	public MainVO getMemberAgeStatics() {
		return mybatis.selectOne("Main.getMemberAgeStatics");
	}
	
	public MainVO getSiteStatics() {
		return mybatis.selectOne("Main.getSiteStatics");
	}
	
	public MainVO getSellStatics() {
		return mybatis.selectOne("Main.getSellStatics");
	}
}
