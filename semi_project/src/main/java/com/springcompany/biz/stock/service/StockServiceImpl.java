package com.springcompany.biz.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springcompany.biz.stock.dao.StockDAO;
import com.springcompany.biz.stock.dao.StockVO;

@Service
public class StockServiceImpl implements StockService{
	@Autowired
	StockDAO stockDAO;
	
	@Override
	public void insertService(StockVO vo) {
		//stockDAO.insert(vo);
	}

	@Override
	public List<StockVO> getInterestInfo(int num) {
			return stockDAO.getInterestInfo(num);
	}

	@Override
	public int getMemberNum(String id) {
		return stockDAO.getMemberNum(id);
	}

	@Override
	public List<StockVO> getBasketInfo(int num) {
		return stockDAO.getBasketInfo(num);
	}

	@Override
	public void deleteInterests(StockVO vo) {
		stockDAO.deleteInterests(vo);
	}

	@Override
	public void insertBasketInfo(StockVO vo) {
		stockDAO.insertBasketInfo(vo);
		
	}
	
	@Override
	public void getInterests(StockVO vo) {
		stockDAO.getInterests(vo);
	}

	//카테고리별 상품리스트
		@Override
		public List<StockVO> getstockByCategory(StockVO vo) {
			
			return stockDAO.getstock(vo);		
		}

		//옵션 색상 종류 (따로)
		public List<String> getcolorList(String optionColorList) {
			return stockDAO.getcolor(optionColorList);			
		}
		
		public StockVO getProduct(int stockNum) {
			
			return stockDAO.getoneProduct(stockNum);
		}
	
}
