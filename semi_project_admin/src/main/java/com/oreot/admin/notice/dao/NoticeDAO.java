package com.oreot.admin.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	// 공지사항 전체 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo){
		return mybatis.selectList("Notice.getNoticeList", vo);
	}
		
	// 공지사항 한개 조회
	public NoticeVO getNoticeInfo(NoticeVO vo) {
		return mybatis.selectOne("Notice.getNoticeInfo",vo);
	}
	
	// 공지사항 등록
	public void insertNotice(NoticeVO vo) {
		mybatis.insert("Notice.insertNotice", vo); 
	}
		
	// 공지사항 수정
	public void updateNotice(NoticeVO vo) {
		if(vo.getNoticePhoto().equals("")) {
			mybatis.update("Notice.updateNotice_noFile", vo);
		} else {
			mybatis.update("Notice.updateNotice", vo);
		}
	}
	
	// 공지사항 삭제
	public void deleteNotice(NoticeVO vo) {
		mybatis.delete("Notice.deleteNotice", vo); 
	}

}
