package com.oreot.prz.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreot.admin.payment.dao.PaymentVO;
import com.oreot.admin.payment.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();// ConditionMap이라고 명명해줬다.
	
		conditionMap.put("주문자", "memberId");
		conditionMap.put("상품명", "stockName");
		
		return conditionMap;
	}

	@RequestMapping("payment.do")
	public String goAdminPayment(Model model, PaymentVO vo, HttpSession session){
		System.out.println("결제관리 화면 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("stockName");
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		List<PaymentVO> list = paymentService.getPaymentList(vo);
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("paymentList", list);
		
		return "admin/adminPayment";
	}
	
	@RequestMapping("popup/paymentDetail.do")
	public String goPaymentDetailModal(Model model, PaymentVO vo, HttpSession session){
		System.out.println("거래내역 상세보기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		PaymentVO payment= paymentService.getPaymentInfo(vo);
		model.addAttribute("payment", payment);
		
		return "modal/paymentDetailModal";
	}
	
	@RequestMapping("updatePaymentStatus.do")
	public String updatePaymentStatus(Model model, PaymentVO vo, HttpSession session){
		System.out.println("결제상태 변경하기..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		paymentService.updatePaymentStatus(vo);
		
		return "redirect:payment.do";
	}
}
