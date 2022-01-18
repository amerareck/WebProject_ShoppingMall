package com.oreot.admin.stock.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oreot.admin.notice.dao.NoticeVO;

@Repository
public class StockDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<StockVO> getStockList() {
		return mybatis.selectList("Stock.getStockList");
	}
	
	public List<StockVO> getLcategories() {
		return mybatis.selectList("Stock.getLcategories");
	}
	
	public List<StockVO> getScategories(StockVO vo) {
		return mybatis.selectList("Stock.getScategories", vo);
	}
	
	public StockVO getCheckStockCode(StockVO vo) {
		return mybatis.selectOne("Stock.getCheckStockCode", vo);
	}
	
	public StockVO getStockNumToStockCode(StockVO vo) {
		return mybatis.selectOne("Stock.getStockNumToStockCode", vo);
	}
	
	public List<StockVO> getStockOptionInfo(StockVO vo) {
		return mybatis.selectList("Stock.getStockOptionInfo", vo);
	}
	
	public StockVO getStockInfo(StockVO vo) {
		return mybatis.selectOne("Stock.getStockInfo", vo);
	}
	
	public StockVO getStockOptionInfoOne(StockVO vo) {
		return mybatis.selectOne("Stock.getStockOptionInfoOne", vo);
	}
	
	// 상품 등록
	public void insertStock(StockVO vo) {
		mybatis.insert("Stock.insertStock", vo); 
	}
	
	// 상품 옵션 등록
	public void insertStockOption(StockVO vo) {
		mybatis.insert("Stock.insertStockOption", vo); 
	}
	
	// 상품 수정
	public void updateStock(StockVO vo) {
		if(vo.getStockPhoto().equals("")) {
			mybatis.update("Stock.updateStock_noFile", vo);
		} else {
			mybatis.update("Stock.updateStock", vo);
		}
	}
	
	// 상품 옵션 수정
	public void updateStockOption(StockVO vo) {
		mybatis.update("Stock.updateStockOption", vo);
	}
	
	// 상품 삭제
	public void deleteStock(StockVO vo) {
		System.out.println(vo.getCountingStockNum());
		if(Integer.parseInt(vo.getCountingStockNum()) > 0) {
			mybatis.delete("Stock.deleteStockToOption", vo);
		}
		mybatis.delete("Stock.deleteStock", vo);
	}
	
	// 상품 옵션 삭제
	public void deleteStockOption(StockVO vo) {
		mybatis.delete("Stock.deleteStockOption", vo); 
	}

}
