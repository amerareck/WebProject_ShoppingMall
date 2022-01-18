package com.springcompany.prz.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.springcompany.biz.user.dao.UserVO;
import com.springcompany.biz.user.service.UserService;

@Controller
public class RegisterController {
	
	private static final Logger Logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "register.me", method = RequestMethod.GET)
	public String registerForm() throws Exception {
		Logger.info("get signup");
		System.out.println("회원가입 화면 처리..");
		
		return "/main/register";
	}
	@RequestMapping(value = "register.me", method = RequestMethod.POST)
	public String registerProc(UserVO vo, @RequestParam String con_memberPass, Model model) throws Exception {
		Logger.info("post signup");
		System.out.println("회원가입 처리..");
		
		//필수정보 입력 체크
		if(vo==null || vo.getMemberId()=="" || vo.getMemberPass()=="" || vo.getMemberName()=="" || vo.getMemberEmail()=="" || vo.getMemberTel()=="" || vo.getMemberAddress()=="") {
			model.addAttribute("msg","필수 입력란은 모두 적으셔야 합니다.");
			model.addAttribute("url","register.me");
			return "/main/redirect";
		}
		
		//비밀번호 중복 체크
		if(!con_memberPass.equals(vo.getMemberPass())) {
			model.addAttribute("msg","비밀번호를 다시 확인하여 주십시오.");
			model.addAttribute("url","register.me");
			return "/main/redirect";
		}
		
		UserVO db = userService.getMemberInfo(vo.getMemberId());
		//유니크 체크
		if(db!=null) {
			if(vo.getMemberId().equals(db.getMemberId())) {
				model.addAttribute("msg","이미 존재하는 계정입니다.");
				model.addAttribute("url","register.me");
				return "/main/redirect";
			}
		}
		
		//생년월일 조합
		if(vo.getMonth().length()<2) vo.setMonth("0"+vo.getMonth());
		if(vo.getDay().length()<2) vo.setDay("0"+vo.getDay());
		vo.setMemberBirth(vo.getYear()+vo.getMonth()+vo.getDay());
		
		
		
		//------------------------------------
		userService.signup(vo);
		return "/main/registComplete";

	}	
	
}
