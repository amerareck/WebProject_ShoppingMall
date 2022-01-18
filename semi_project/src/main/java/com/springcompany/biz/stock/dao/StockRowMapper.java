package com.springcompany.biz.stock.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class StockRowMapper implements RowMapper<StockVO>{

	@Override
	public StockVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		StockVO user = new StockVO();
		
		return user;
	}
	
}
