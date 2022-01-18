package com.oreot.admin.payment.service;

import java.util.List;

import com.oreot.admin.payment.dao.PaymentVO;

public interface PaymentService { 

	// 전체 문의 조회
	List<PaymentVO> getPaymentList(PaymentVO vo);
	
	// 문의 상세보기
	PaymentVO getPaymentInfo(PaymentVO vo);
	
	// 답변하기 수정
	void updatePaymentStatus(PaymentVO vo);
			
		
}





 