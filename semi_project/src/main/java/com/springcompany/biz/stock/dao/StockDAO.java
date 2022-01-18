package com.springcompany.biz.stock.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<StockVO> getInterestInfo(int num) {
		return mybatis.selectList("StockDAO.getInterestInfo", num);
	}
	
	public int getMemberNum(String id) {
		return mybatis.selectOne("StockDAO.getMemberNum", id);
	}
	
	public List<StockVO> getBasketInfo(int num) {
		return mybatis.selectList("StockDAO.getBasketInfo", num);
	}
	
	public void deleteInterests(StockVO vo) {
		 mybatis.delete("StockDAO.deleteInterests", vo);
	}
	
	public void insertBasketInfo(StockVO vo) {
		mybatis.insert("StockDAO.insertBasketInfo", vo);
	}
	
	public void getInterests(StockVO vo) {
		mybatis.insert("StockDAO.getInterests", vo);
	}
	
	
	//대카테고리별 상품리스트
		public List<StockVO> getstock(StockVO vo) {
			
			if(vo.getScategoriesNum()==0) {
				System.out.println("대카테고리");
				return mybatis.selectList("StockDAO.getstockL", vo);
				
			}else {
				System.out.println("소카테고리");
				return mybatis.selectList("StockDAO.getstockS", vo);
			}	
		}
		
		// 컬러리스트	
		public List<String> getcolor(String optionColorList) {
			return mybatis.selectOne("StockDAO.getcolor", optionColorList);
		}
		
		//상품 상세 보기
		public StockVO getoneProduct(int stockNum) {
			
			return mybatis.selectOne("StockDAO.getproduct", stockNum);
		}
}

