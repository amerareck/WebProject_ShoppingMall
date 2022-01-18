package com.oreot.admin.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oreot.admin.notice.dao.NoticeVO;

@Repository
public class QnaDAO {

	@Autowired
	SqlSessionTemplate mybatis;
		
	public List<QnaVO> getQnaList(QnaVO vo){
		if(vo.getSearchCondition().equals("inquireTitle")) {
			return mybatis.selectList("Qna.getQnaList_T", vo);
		}else if(vo.getSearchCondition().equals("stockName")) {
			return mybatis.selectList("Qna.getQnaList_SN", vo);
		}else if(vo.getSearchCondition().equals("memberId")) {
			return mybatis.selectList("Qna.getQnaList_MI", vo);
		}else if(vo.getSearchCondition().equals("replyStatus")) {
			return mybatis.selectList("Qna.getQnaList_RS", vo);
		}else { // 디폴트는 제목, 즉 TITLE로.
			return mybatis.selectList("Qna.getQnaList_T", vo);
		}
	}
		
	public QnaVO getQnaInfo(QnaVO vo) {
		return mybatis.selectOne("Qna.getQnaInfo",vo);
	}
		
	public void updateQnaStatus(QnaVO vo,String status) {
		if(status.equals("insert")) {
			mybatis.update("Qna.updateQnaStatus_I", vo);
		} else {
			mybatis.update("Qna.updateQnaStatus_U", vo);
		}
	}
}
