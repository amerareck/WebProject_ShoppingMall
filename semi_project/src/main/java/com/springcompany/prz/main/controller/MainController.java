package com.springcompany.prz.main.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.springcompany.biz.main.dao.MainVO;
import com.springcompany.biz.main.service.MainService;
import com.springcompany.biz.stock.dao.StockVO;
import com.springcompany.biz.user.dao.UserVO;

@Controller
@SessionAttributes("member")
public class MainController {
	
	@Autowired
	MainService mainService;

	//마이페이지 (이동/...)
	@RequestMapping(value = "myPage.me", method = RequestMethod.GET)
	public String myPageView(HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("member");

		//로그인 세션 확인
		if(null!=user) {
			System.out.println("마이페이지 이동...");
			return "/main/myPage";
		};
		System.out.println("세션정보없음, 로그인페이지 이동...");
		return "/main/login";
	}
	
	//내정보수정 (이동/..)
	@RequestMapping(value = "editInfo.me", method = RequestMethod.GET)
	public String editInfoView(MainVO vo, HttpSession session, Model model) {
		System.out.println("내 정보 수정페이지 이동...");
		
		//로그인 가라로 처리한 것을 받으면서 비교.
		UserVO member = (UserVO)session.getAttribute("member");
		System.out.println(member);
		
		//로그인 세션 확인
		if(member!=null) {
			// id로 회원정보 받아서 model에 던짐.
			vo = mainService.getMemberInfo(member.getMemberId());
			vo.setYear(vo.getMemberBirth().substring(0, 4));
			vo.setMonth(vo.getMemberBirth().substring(4, 6));
			vo.setDay(vo.getMemberBirth().substring(6, 8));
			System.out.println(vo);
			model.addAttribute("main", vo);
			
			System.out.println("회원정보 받음 같이 리턴.");
			return "/main/editInfo";
		};
		System.out.println("세션정보없음, 로그인페이지 이동...");
		return "/main/login";
	}
	
	@RequestMapping(value = "editInfo.me", method = RequestMethod.POST)
	public String editInfoPostView(@ModelAttribute MainVO vo, @RequestParam("con_memberPass") String chpass, HttpServletResponse response, HttpSession session, Model model, SessionStatus sessionStatus) {
		System.out.println("내 정보 수정 접수...");
		System.out.println(vo);
		
		// 세션, 비밀번호, DB 정보 확인
		UserVO member = (UserVO)session.getAttribute("member");
		vo.setMemberId(member.getMemberId());
		MainVO checkSession = mainService.getMemberInfo(member.getMemberId());
		
		// 스크립트 aleart를 야매처리하기 위해 redirect를 호출해서 model에 넘긴 것.
		// redirect가 JSP 페이지이므로, 세션은 넘어가지만 req는 사라짐에 유의하자.
		if(!vo.getMemberId().equals(member.getMemberId())) {
			System.out.println("세션 정보와 불일치.");
			return "redirect:editInfo.me";
		} else if(!chpass.equals(vo.getMemberPass())) {
			System.out.println("비밀번호 체크 실패.");
			model.addAttribute("msg", "비밀번호를 다시 확인해 주십시오.");
			model.addAttribute("url","editInfo.me");
			return "/main/redirect";
		} else if(!vo.getMemberPass().equals(checkSession.getMemberPass())) {
			System.out.println("DB에 등록된 정보가 아님");
			model.addAttribute("msg", "계정 정보가 존재하지 않습니다.");
			model.addAttribute("url","redirect:editInfo.me");
			return "/main/redirect";
		}
		
		// 생년월일 정리정돈
		if(vo.getMonth().length()<2) vo.setMonth("0"+vo.getMonth());
		if(vo.getDay().length()<2) vo.setDay("0"+vo.getDay());
		vo.setMemberBirth(vo.getYear()+vo.getMonth()+vo.getDay());
		System.out.println(vo);
		
		// 멤버 정보 업데이트.
		mainService.updateMemberInfo(vo);
		sessionStatus.setComplete(); // 기존 세션 제거.
		mainService.updateSession(member, vo); // vo의 멤버변수들 member에 저장.
		
		model.addAttribute("member", member); // 세션에 저장.
		System.out.println("내 정보 수정 성공.");
		model.addAttribute("msg", "내 정보 수정이 성공하였습니다!");
		model.addAttribute("url","redirect:editInfo.me");
		return "/main/redirect";
	}
	
	//적립금확인 (이동/..)
	@RequestMapping(value = "myaccumulated.me", method = RequestMethod.GET)
	public String checkAccumulatedView(@ModelAttribute MainVO vo, HttpSession session, Model model) {
		System.out.println("적립금 확인페이지 이동...");
		UserVO member = (UserVO)session.getAttribute("member");
		
		//로그인 세션 확인
		if(member==null) {
			System.out.println("세션정보없음, 로그인페이지 이동...");
			return "/main/login";
		};
		vo = mainService.getMemberInfo(member.getMemberId());
		
		//멤버 정보를 통해 적립금 리스트 출력 후 전달.
		List<MainVO> listVo = mainService.getMemberAccumulated(vo.getMemberNum());
		model.addAttribute("main", listVo);
		
		//문제점 : 총 적립금을 어떻게 표현할 것인가? (리스트 받아서 합산하고 빼서 리턴?)
		//생각한 대로 뽑고 야매로 처리했음.
		int totalAccumulatedMoney = 0;
		for(MainVO avo : listVo) {
			if(avo.getAccumulatedUse().equals("ADD")) {
				totalAccumulatedMoney += avo.getAccumulatedMoney();
			} else if(avo.getAccumulatedUse().equals("USE")) {
				totalAccumulatedMoney -= avo.getAccumulatedMoney();
			}
		}
		model.addAttribute("totalAccumulatedMoney", totalAccumulatedMoney);
		
		return "/main/accumulated";
	}
	
	//내리뷰확인(=내가쓴글)
	@RequestMapping(value = "myboard.me", method = RequestMethod.GET)
	public String myboardView(@ModelAttribute MainVO vo, HttpSession session, Model model) {
		System.out.println("내 정보 수정페이지 이동...");
		UserVO member = (UserVO)session.getAttribute("member");
		
		//로그인 세션 확인
		if(member==null) {
			System.out.println("세션정보없음, 로그인페이지 이동...");
			return "/main/login";
		};
		vo = mainService.getMemberInfo(member.getMemberId());
		
		//멤버 정보를 이용하여 작성 리뷰글 끌어오기.
		List<StockVO> reviewList = mainService.getMyReviewList(vo.getMemberNum());
		model.addAttribute("main", reviewList);
		
		return "/main/checkBoardList3";
	}
	
	//Q&A (이동/..)
	@RequestMapping(value = "myqna.me", method = RequestMethod.GET)
	public String myQnaView(@ModelAttribute MainVO vo, HttpSession session, Model model) {
		System.out.println("QnA 페이지 이동...");
		UserVO member = (UserVO)session.getAttribute("member");
		
		//로그인 세션 확인
		if(null==member.getMemberId()) {
			System.out.println("세션정보없음, 로그인페이지 이동...");
			return "/main/login";
		};
		vo = mainService.getMemberInfo(member.getMemberId());
		
		//멤버 정보를 이용하여 QnA 게시글 끌어오기.
		List<MainVO> qnaList = mainService.getMyQnaList(vo.getMemberNum());
		List<MainVO> noticeList = mainService.getQnaNotice(); // 시간없어서 걍 따로 뽑아옴.
		model.addAttribute("main", qnaList);
		model.addAttribute("notice", noticeList);
		
		return "/main/qna";
	}
	
	//Q&A (문의게시글 작성페이지 이동)
	@RequestMapping(value = "insertQna.me", method = RequestMethod.GET)
	public String insertQnaView(HttpSession session, Model model) {
		System.out.println("QnA 작성 페이지 이동...");
		UserVO member = (UserVO)session.getAttribute("member");
		
		//로그인 세션 확인
		if(null==member.getMemberId()) {
			System.out.println("세션정보없음, 로그인페이지 이동...");
			return "/main/login";
		}
		
		List<MainVO> stockInfo = mainService.getStockList();
		model.addAttribute("main", stockInfo);
		
		return "/main/insertQna";
	}
	//Q&A (게시글 INSERT)
	@RequestMapping(value = "insertQna.me", method = RequestMethod.POST)
	public String insertQna(@ModelAttribute MainVO vo, HttpSession session) {
		System.out.println("QnA 작성시도 !");
		UserVO member = (UserVO)session.getAttribute("member");
		
		//로그인 세션 확인
		if(null==member) {
			System.out.println("세션정보없음, 로그인페이지 이동...");
			//스크립트 (alert("세션이 만료되었습니다. 로그인 후 재시도를 부탁드립니다."))
			return "/main/login";
		}
		
		vo = mainService.getSessionMemberInfo(vo, member);
		System.out.println(vo);
		mainService.insertQuestionBoard(vo);
		
		System.out.println("QnA 게시글 작성 성공...!");
		return "redirect:myqna.me";
	}
	
		//Q&A 게시글 조회
		@RequestMapping(value = "qnaView.me", method = RequestMethod.GET)
		public String qnaView(@RequestParam int inquire, Model model) {
			System.out.println("QnA 페이지 상세보기...");
			Integer inquireN = inquire;

			MainVO vo = mainService.getMyQna(inquireN.intValue());
			model.addAttribute("boardTitle","나의 QnA");
			model.addAttribute("main", vo);
			return "/main/qnaView";
		}
		
		//Q&A 공지사항 조회
		@RequestMapping(value = "noticeView.me", method = RequestMethod.GET)
		public String noticeView(@RequestParam int notice, Model model) {
			System.out.println("QnA 페이지 상세보기...");
			Integer noticeN = notice;
			
			MainVO vo = mainService.getNotice(noticeN.intValue());
			model.addAttribute("boardTitle","공지사항");
			model.addAttribute("main", vo);
			return "/main/qnaView";
		}
		
		//결제 페이지
		@RequestMapping(value = "checkOut.me", method = RequestMethod.GET)
		public String getCheckout(@ModelAttribute MainVO vo, HttpSession session, Model model) {
			System.out.println("결제 페이지 이동...");
			UserVO member = (UserVO)session.getAttribute("member");
			
			//로그인 세션 확인
			if(null==member.getMemberId()) {
				System.out.println("세션정보없음, 로그인페이지 이동...");
				model.addAttribute("msg", "회원만 가능한 페이지입니다.");
				model.addAttribute("url", "login.me");
				return "/main/redirect";
			};
			vo = mainService.getMemberInfo(member.getMemberId());
			
			return "/main/checkOut";
		}
		
	//ajax좀더알아보자 하 -_-; -> 시간이 없어서 페이지로 상품번호 몽땅 넘기는 걸로 일단 퉁.
	@RequestMapping(value="stockList.do{option}", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String getStockList(@PathVariable String option) {
		System.out.println(option);
//		List<StockVO> options = mainService.getCategoriesList(option);
//		List<String> optionList = new ArrayList<String>();
//		for(StockVO op : options) {
//			optionList.add(op.getScategoriesName());
//		}
		/*
		 * JSONArray jsonArray = new JSONArray(); for(int i=0; i<optionList.size(); i++)
		 * { jsonArray.put(optionList.get(i)); }
		 * 
		 * return jsonArray.toString();
		 */
		return null;
	}
}
