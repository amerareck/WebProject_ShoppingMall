package com.springcompany.biz.main.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MainRowMapper implements RowMapper<MainVO>{

	@Override
	public MainVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MainVO user = new MainVO();
		
		/*
		 * user.setId(rs.getString("id")); user.setName(rs.getString("name"));
		 * user.setPassword(rs.getString("password"));
		 * user.setRole(rs.getString("role"));
		 */
		
		return user;
	}
	
}
