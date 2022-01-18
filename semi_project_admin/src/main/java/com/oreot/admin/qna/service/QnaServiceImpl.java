package com.oreot.admin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreot.admin.qna.dao.QnaVO;
import com.oreot.admin.qna.dao.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	QnaDAO QnaDAO;
	
	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		return QnaDAO.getQnaList(vo);
	}

	@Override
	public QnaVO getQnaInfo(QnaVO vo) {
		return QnaDAO.getQnaInfo(vo);
	}

	@Override
	public void updateQnaStatus(QnaVO vo,String status) {
		QnaDAO.updateQnaStatus(vo,status);
	}	
}
