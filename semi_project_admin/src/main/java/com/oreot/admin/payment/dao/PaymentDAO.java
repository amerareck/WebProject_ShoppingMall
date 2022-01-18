package com.oreot.admin.payment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<PaymentVO> getPaymentList(PaymentVO vo){
		if(vo.getSearchCondition().equals("stockName")) {
			return mybatis.selectList("Payment.getPaymentList_SN", vo);
		}else if(vo.getSearchCondition().equals("memberId")) {
			return mybatis.selectList("Payment.getPaymentList_MI", vo);
		}else { 
			return mybatis.selectList("Payment.getPaymentList_SN", vo);
		}
	}
		
	public PaymentVO getPaymentInfo(PaymentVO vo) {
		return mybatis.selectOne("Payment.getPaymentInfo",vo);
	}
		
	public void updatePaymentStatus(PaymentVO vo) {
		mybatis.update("Payment.updatePaymentStatus", vo);
	}

}
