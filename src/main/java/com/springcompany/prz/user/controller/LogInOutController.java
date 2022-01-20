package com.springcompany.prz.user.controller;



import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.springcompany.biz.user.dao.UserVO;
import com.springcompany.biz.user.service.UserService;

@Controller
@SessionAttributes("member")
public class LogInOutController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "login.me", method = RequestMethod.GET)
	public String loginForm() {
		System.out.println("로그인 화면으로 이동");
		
		return "main/login";
	}
	
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String loginProc(@ModelAttribute UserVO vo, Model model, HttpServletResponse response) { // 여기에 매개변수를 적으면 request, response가능
		System.out.println("로그인 처리..");

		 if(vo.getMemberId() == null || vo.getMemberId().equals("")) { // null이거나 빈 문자열""일 때 강제로
			model.addAttribute("msg", "아이디는 공백일 수 없습니다.");
			model.addAttribute("url","login.me");
			return "/main/redirect";
		 }
		 // DB에서 멤버 정보를 가져와서 user에 전달.
		 UserVO user = userService.getMemberInfo(vo.getMemberId());
		 
		 if(user == null || !user.getMemberPass().equals(vo.getMemberPass())) {
			model.addAttribute("msg", "회원 정보가 존재하지 않습니다.");
			model.addAttribute("url","login.me");
			return "/main/redirect";
		  }
		 // 회원 장바구니, 관심상품 정보 넘김. (먼저 그 갯수부터)
		 UserVO getInfo = userService.getBasketNum(user.getMemberNum());
		 
		 // 세션에 로그인 정보를 UserVO 객체로 넘겼음.
		 vo = user;
		 vo.setMemberBasketNum(getInfo.getMemberBasketNum());
		 vo.setMemberInterItem(getInfo.getMemberInterItem());
		 model.addAttribute("member", vo);
		 
		 return "redirect:/";
	}
	
	// 로그아웃을 처리하기 위한 메서드
	@RequestMapping("logout.me")
	public String logoutProc(HttpSession session, SessionStatus sessionStatus) {
		System.out.println("로그아웃 처리.");
		
		session.invalidate(); // 그 session을 한번에 모두 삭제해주는 기능:invalidate 메서드
		sessionStatus.setComplete(); // @SessionAttributes에 의해 저장된 오브젝트를 제거
		
		return "redirect:login.me";
	}
}
