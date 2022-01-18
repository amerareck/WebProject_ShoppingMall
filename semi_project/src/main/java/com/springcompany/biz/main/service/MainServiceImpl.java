package com.springcompany.biz.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springcompany.biz.main.dao.MainDAO;
import com.springcompany.biz.main.dao.MainVO;
import com.springcompany.biz.stock.dao.StockVO;
import com.springcompany.biz.user.dao.UserVO;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	MainDAO mainDAO;
	
	@Override
	public void updateMemberInfo(MainVO vo) {
		System.out.println("updateMemberInfo 호출");
		System.out.println(vo);
		UserVO userVO = new UserVO();
		userVO.setMemberId(vo.getMemberId());
		userVO.setMemberPass(vo.getMemberPass());
		userVO.setMemberEmail(vo.getMemberEmail());
		userVO.setMemberTel(vo.getMemberTel());
		userVO.setMemberBirth(vo.getMemberBirth());
		userVO.setMemberName(vo.getMemberId());
		
		mainDAO.updateMemberInfo(userVO);
	}
	
	public MainVO getMemberInfo(String id) {
		System.out.println("getMemberInfo 호출");
		return mainDAO.getMemberInfo(id);
	}
	
	@Override
	public List<MainVO> getMemberAccumulated(int num) {
		System.out.println("getMemberAccumulated 호출");
		return mainDAO.getMemberAccumulated(num);
	}

	@Override
	public List<StockVO> getMyReviewList(int num) {
		System.out.println("getMyReviewList 호출");
		return mainDAO.getMyReviewList(num);
	}

	@Override
	public List<MainVO> getMyQnaList(int num) {
		System.out.println("getMyQnaList 호출");
		return mainDAO.getMyQnaList(num);
	} 
	
	@Override
	public MainVO getMyQna(int num) {
		System.out.println("getMyQna 호출");
		return mainDAO.getMyQna(num);
	} 
	
	@Override
	public MainVO getNotice(int num) {
		System.out.println("getMyQna 호출");
		return mainDAO.getNotice(num);
	} 
	
	public List<MainVO> getQnaNotice() {
		System.out.println("getQnaNotice 호출");
		return mainDAO.getQnaNotice();
	}

	@Override
	public void insertQuestionBoard(MainVO vo) {
		System.out.println("insertQuestionBoard 호출");
		mainDAO.insertQuestionBoard(vo);
	}

	@Override
	public List<MainVO> getStockList() {
		return mainDAO.getStockList();
	}

//	@Override
//	public List<StockVO> getCategoriesList(String name) {
//		return mainDAO.getCategoriesList(name);
//	}
	
	@Override
	public UserVO updateSession(UserVO member, MainVO vo) {
		member.setMemberNum(vo.getMemberNum());
		member.setMemberId(vo.getMemberId());
		member.setMemberPass(vo.getMemberPass());
		member.setMemberName(vo.getMemberName());
		member.setMemberEmail(vo.getMemberEmail());
		member.setMemberTel(vo.getMemberTel());
		member.setMemberBirth(vo.getMemberBirth());
		return member;
	}

	@Override
	public MainVO getSessionMemberInfo(MainVO vo, UserVO member) {
		vo.setMemberNum(member.getMemberNum());
		vo.setMemberId(member.getMemberId());
		vo.setMemberPass(member.getMemberPass());
		vo.setMemberName(member.getMemberName());
		vo.setMemberEmail(member.getMemberEmail());
		vo.setMemberTel(member.getMemberTel());
		vo.setMemberBirth(member.getMemberBirth());
		return vo;
	}

	public void insertService(MainVO vo) {
		
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
