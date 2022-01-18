package com.oreot.prz.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreot.admin.main.dao.MainVO;
import com.oreot.admin.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;

	// 로그인 화면 이동
	@RequestMapping("login.do")
	public String goAdminLogin(){
		System.out.println("로그인 화면 이동..");
		
		return "admin/adminLogin";
	}
	
	// 로그인정보 확인 Ajax
	@RequestMapping(value="checkAdminAjax.do")
	@ResponseBody
	public HashMap<String, String> checkAdminAjax(MainVO vo){
		System.out.println("아이디확인 처리..");
		
		String memberId = vo.getMemberId();
		String memberPass = vo.getMemberPass();
		
		MainVO main = mainService.getAdminIdPw(); // 비즈니스로직의 시작인 서비스딴으로
		
		HashMap<String, String> result = new HashMap<String, String>();
		if(memberId.equals(main.getMemberId()) && memberPass.equals(main.getMemberPass())){ 
			result.put("result", "success");
		} else { 
			result.put("result", "fail");
		}

		return result;
	}
	
	// 로그인 처리 세션저장
	@RequestMapping(value="adminlogin.do", method=RequestMethod.POST)
	public String adminLoginProc(MainVO vo, HttpSession session){
		System.out.println("로그인 처리..");
				
		MainVO main = mainService.getAdminInfo(vo.getMemberId()); // 비즈니스로직의 시작인 서비스딴으로
		session.setAttribute("memberName", main.getMemberName());
		session.setAttribute("memberNum", main.getMemberNum());
		
		return "redirect:dashboard.do";
	}
	
	// 로그아웃
	@RequestMapping("adminlogout.do")
	public String logoutProc(HttpSession session) {
		System.out.println("로그아웃 처리.");
		
		session.invalidate(); 
			
		return "redirect:login.do";
	}
	
	// 대쉬보드 이동
	@RequestMapping("dashboard.do")
	public String goDashBoard(Model model, HttpSession session){
		System.out.println("대쉬보드 화면 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		MainVO ageStatics = mainService.getMemberAgeStatics();
		MainVO siteStatics = mainService.getSiteStatics();
		MainVO sellStatics = mainService.getSellStatics();
		
		model.addAttribute("ageStatics", ageStatics);
		model.addAttribute("siteStatics", siteStatics);
		model.addAttribute("sellStatics", sellStatics);
		
		return "admin/adminDashboard";
	}
	
}
