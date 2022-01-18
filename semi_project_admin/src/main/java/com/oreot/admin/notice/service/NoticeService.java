package com.oreot.admin.notice.service;

import java.util.List;

import com.oreot.admin.notice.dao.NoticeVO;

public interface NoticeService { // 이 정의 자체가 interface이기 때문에 모두 이름만 가지고 있는 추상메서드.

	// 공지사항 전체보기
	List<NoticeVO> getNoticeList(NoticeVO vo);
	
	// 공지사항 상세보기
	NoticeVO getNoticeInfo(NoticeVO vo);
	
	// 공지사항 추가
	void insertNotice(NoticeVO vo);
	
	// 공지사항 수정
	void updateNotice(NoticeVO vo);
	
	// 공지사항 삭제
	void deleteNotice(NoticeVO vo);
}





 