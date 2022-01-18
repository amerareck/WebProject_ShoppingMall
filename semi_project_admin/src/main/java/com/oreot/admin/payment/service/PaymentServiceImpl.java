package com.oreot.admin.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreot.admin.payment.dao.PaymentDAO;
import com.oreot.admin.payment.dao.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	PaymentDAO paymentDAO;
	
	
	@Override
	public List<PaymentVO> getPaymentList(PaymentVO vo) {
		return paymentDAO.getPaymentList(vo);
	}


	@Override
	public PaymentVO getPaymentInfo(PaymentVO vo) {
		return paymentDAO.getPaymentInfo(vo);
	}


	@Override
	public void updatePaymentStatus(PaymentVO vo) {
		paymentDAO.updatePaymentStatus(vo);
	}
	
}
