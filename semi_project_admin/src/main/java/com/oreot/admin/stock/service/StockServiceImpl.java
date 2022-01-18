package com.oreot.admin.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreot.admin.stock.dao.StockDAO;
import com.oreot.admin.stock.dao.StockVO;

@Service
public class StockServiceImpl implements StockService{
	@Autowired
	StockDAO stockDAO;
	
	@Override
	public List<StockVO> getStockList() {
		return stockDAO.getStockList();
	}
	
	@Override
	public List<StockVO> getLcategories() {
		return stockDAO.getLcategories();
	}
	
	@Override
	public List<StockVO> getScategories(StockVO vo) {
		return stockDAO.getScategories(vo);
	}
	
	@Override
	public StockVO getCheckStockCode(StockVO vo) {
		return stockDAO.getCheckStockCode(vo);
	}
	
	@Override
	public StockVO getStockNumToStockCode(StockVO vo) {
		return stockDAO.getStockNumToStockCode(vo);
	}
	
	@Override
	public List<StockVO> getStockOptionInfo(StockVO vo) {
		return stockDAO.getStockOptionInfo(vo);
	}
	
	
	
	@Override
	public StockVO getStockOptionInfoOne(StockVO vo) {
		return stockDAO.getStockOptionInfoOne(vo);
	}
	
	@Override
	public StockVO getStockInfo(StockVO vo) {
		return stockDAO.getStockInfo(vo);
	}

	@Override
	public void insertStock(StockVO vo) {
		stockDAO.insertStock(vo);
	}
	
	@Override
	public void insertStockOption(StockVO vo) {
		stockDAO.insertStockOption(vo);
	}
	
	@Override
	public void updateStock(StockVO vo) {
		stockDAO.updateStock(vo);
	}
	
	@Override
	public void updateStockOption(StockVO vo) {
		stockDAO.updateStockOption(vo);
	}
	
	@Override
	public void deleteStock(StockVO vo) {
		stockDAO.deleteStock(vo);
	}
	
	@Override
	public void deleteStockOption(StockVO vo) {
		stockDAO.deleteStockOption(vo);
	}
	
//	@Override
//	public List<UserVO> getServiceList() {
//		return stockDAO.getList();
//	}
//
//	@Override
//	public UserVO getService(String id) {
//		return stockDAO.getObject(id);
//	}
//
//	@Override
//	public void updateService(UserVO vo) {
//		stockDAO.update(vo);
//	}
//
//	@Override
//	public void deleteService(int seq) {
//		stockDAO.delete(seq);
//	}
	
}
