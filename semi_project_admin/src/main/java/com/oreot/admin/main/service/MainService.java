package com.oreot.admin.main.service;

import com.oreot.admin.main.dao.MainVO;

public interface MainService {
	
	MainVO getAdminIdPw();
	
	MainVO getAdminInfo(String id);
	
	MainVO getMemberAgeStatics();

	MainVO getSiteStatics();
	
	MainVO getSellStatics();
}





 