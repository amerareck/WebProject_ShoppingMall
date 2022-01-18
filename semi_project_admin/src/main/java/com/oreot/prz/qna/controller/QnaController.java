package com.oreot.prz.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreot.admin.qna.dao.QnaVO;
import com.oreot.admin.qna.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();// ConditionMap이라고 명명해줬다.
	
		conditionMap.put("문의제목", "inquireTitle");
		conditionMap.put("상품명", "stockName");
		conditionMap.put("문의자", "memberId");
		conditionMap.put("답변여부", "replyStatus");
		
		return conditionMap;
	}


	@RequestMapping("qna.do")
	public String goAdminQna(Model model, QnaVO vo, HttpSession session){
		System.out.println("1:1문의관리 화면 이동");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("inquireTitle");
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		List<QnaVO> list = qnaService.getQnaList(vo);
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("qnaList", list);
		
		return "admin/adminQna";
	}
	
	@RequestMapping("popup/qnaDetail.do")
	public String goQnaDetailModal(Model model, QnaVO vo, HttpSession session){
		System.out.println("문의사항 상세보기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		QnaVO qna= qnaService.getQnaInfo(vo);
		model.addAttribute("qna", qna);
		
		return "modal/qnaDetailModal";
	}
	
	@RequestMapping("popup/qnaReplyForm.do")
	public String goQnaReplyForm(Model model, QnaVO vo, HttpSession session){
		System.out.println("문의사항 답변하기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		QnaVO qna= qnaService.getQnaInfo(vo);
		model.addAttribute("qna", qna);
		
		return "modal/qnaReplyModal";
	}
	
	@RequestMapping("qnaReplyProc.do")
	public String qnaReplyProc(Model model, QnaVO vo, HttpSession session){
		System.out.println("문의사항 답변하기..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		qnaService.updateQnaStatus(vo,"insert");
		
		return "redirect:qna.do";
	}
	
	@RequestMapping("popup/qnaReplyModifyForm.do")
	public String goQnaReplyModifyForm(Model model, QnaVO vo, HttpSession session){
		System.out.println("문의사항 답변하기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		QnaVO qna= qnaService.getQnaInfo(vo);
		model.addAttribute("qna", qna);
		
		return "modal/qnaReplyModifyModal";
	}
	
	@RequestMapping("qnaReplyModifyProc.do")
	public String qnaReplyModifyProc(Model model, QnaVO vo, HttpSession session){
		System.out.println("문의사항 답변하기..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		qnaService.updateQnaStatus(vo,"update");
		
		return "redirect:qna.do";
	}
	
}
