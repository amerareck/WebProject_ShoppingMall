package com.oreot.prz.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreot.admin.member.dao.MemberVO;
import com.oreot.admin.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();// ConditionMap이라고 명명해줬다.
	
		conditionMap.put("아이디", "memberId");
		conditionMap.put("이름", "memberName");
		
		return conditionMap;
	}
	
	@RequestMapping("memberlist.do")
	public String goAdminMember(Model model, MemberVO vo, HttpSession session){
		System.out.println("회원관리 화면 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		// 검색 기능 추가
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("memberId"); // null값일 때 디폴트로 TITLE.
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword(""); // String 빈 문자열로 초기화
		}
		
		List<MemberVO> list = memberService.getMemberList(vo);
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("memberList", list);
		
		return "admin/adminMember";
	}
	
	@RequestMapping("popup/memberInfoUpdate.do")
	public String goMemberInfoUpdateModal(Model model, MemberVO vo, HttpSession session){
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		System.out.println("회원정보 수정 모달 이동..");
		
		MemberVO member = memberService.getMemberInfo(vo);
		model.addAttribute("member", member);
		
		return "modal/memberUpdateModal";
	}
	
	// 회원정보 수정
	@RequestMapping("updatemember.do")
	public String updateMemberProc(MemberVO vo, HttpSession session) {
		System.out.println("회원정보 수정 처리.");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
			
		memberService.updateMember(vo);
			
		return "redirect:memberlist.do";
	}
	
	// 회원정보 삭제
	@RequestMapping("deletemember.do")
	public String deleteMemberProc(MemberVO vo, HttpSession session) {
		System.out.println("회원정보 수정 처리.");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
			
		memberService.deleteMember(vo);
			
		return "redirect:memberlist.do";
	}
	
}
