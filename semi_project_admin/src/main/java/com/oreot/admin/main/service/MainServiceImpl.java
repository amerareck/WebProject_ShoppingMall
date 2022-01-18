package com.oreot.admin.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreot.admin.main.dao.MainDAO;
import com.oreot.admin.main.dao.MainVO;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	MainDAO mainDAO;
	
	@Override
	public MainVO getAdminIdPw() {
		return mainDAO.getAdminIdPw();
	}
	
	@Override
	public MainVO getAdminInfo(String id) {
		return mainDAO.getAdminInfo(id);
	}

	@Override
	public MainVO getMemberAgeStatics() {
		return mainDAO.getMemberAgeStatics();
	}

	@Override
	public MainVO getSiteStatics() {
		return mainDAO.getSiteStatics();
	}

	@Override
	public MainVO getSellStatics() {
		return mainDAO.getSellStatics();
	}
	
	
}
