package com.springcompany.biz.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springcompany.biz.user.dao.UserDAO;
import com.springcompany.biz.user.dao.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDAO userDAO;
	
	@Override
	public void signup(UserVO vo) throws Exception{
		userDAO.signup(vo);
	}

	@Override
	public UserVO getMemberInfo(String id) {
		return userDAO.getMemberInfo(id);
	}

	@Override
	public UserVO getBasketNum(int number) {
		return userDAO.getBasketNum(number);
	}
	
//
//	@Override
//	public List<UserVO> getServiceList() {
//		return userDAO.getList();
//	}
//


//
//	@Override
//	public void updateService(UserVO vo) {
//		userDAO.update(vo);
//	}
//
//	@Override
//	public void deleteService(int seq) {
//		userDAO.delete(seq);
//	}

	
	
}
