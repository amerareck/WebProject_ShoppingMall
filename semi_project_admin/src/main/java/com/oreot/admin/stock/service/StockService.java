package com.oreot.admin.stock.service;

import java.util.List;

import com.oreot.admin.stock.dao.StockVO;

public interface StockService {
	
	// 전체 제고 조회
	List<StockVO> getStockList();
	
	// 대분류 리스트 가져오기
	List<StockVO> getLcategories();
	
	// 소분류 리스트 가져오기
	List<StockVO> getScategories(StockVO vo);
	
	// 상품코드 중복 확인
	StockVO getCheckStockCode(StockVO vo);
	
	// 상품코드 중복 확인
	StockVO getStockNumToStockCode(StockVO vo);
	
	// 상품 옵션정보 보기
	List<StockVO> getStockOptionInfo(StockVO vo);
	
	// 상품코드 중복 확인
	StockVO getStockOptionInfoOne(StockVO vo);
	
	// 상품정보 보기
	StockVO getStockInfo(StockVO vo);
	
	void updateStock(StockVO vo);
	
	void updateStockOption(StockVO vo);
		
	// 상품 등록
	void insertStock(StockVO vo);
	
	void insertStockOption(StockVO vo);
	
	// 상품 삭제
	void deleteStock(StockVO vo);
		
	// 상품 옵션 삭제
	void deleteStockOption(StockVO vo);

		
}





 