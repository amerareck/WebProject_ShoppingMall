package com.oreot.admin.qna.service;

import java.util.List;

import com.oreot.admin.qna.dao.QnaVO;

public interface QnaService {

	// 전체 문의 조회
	List<QnaVO> getQnaList(QnaVO vo);
	
	// 문의 상세보기
	QnaVO getQnaInfo(QnaVO vo);
	
	// 답변하기 수정
	void updateQnaStatus(QnaVO vo,String status);
			
}





 