package com.springcompany.prz.stock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springcompany.biz.stock.dao.StockVO;
import com.springcompany.biz.stock.service.StockService;
import com.springcompany.biz.user.dao.UserVO;

@Controller
@SessionAttributes("sessionStock")
public class StockController {
	
	@Autowired
	StockService stockService;
	
	//카테고리별 상품리스트						//(화면만 서비스)
		@RequestMapping(value = "shop.do", method = RequestMethod.GET)
		public String stockView(@ModelAttribute StockVO vo, Model model) {  
			System.out.println("상품 전체보기..");
						
			List<StockVO> stocklist = stockService.getstockByCategory(vo);
		
			//리퀘스트에 보관 - 이동해갈 페이지 지정(db데이터 담아서)
			System.out.println(stocklist);
			model.addAttribute("stocklist", stocklist);
			
			return "/main/shop";
		}
		
		//상품상세보기
		@RequestMapping(value = "product.do", method = RequestMethod.GET)
		public String productView(@ModelAttribute StockVO vo , Model model) {
			System.out.println("상품 상세보기..");
			
			StockVO stock = stockService.getProduct(vo.getStockNum());
			
			System.out.println(stock); //확인
			
			model.addAttribute("stock", stock);
			
			return "/main/product";
		}
	
	//관심상품 (이동/...)
		@RequestMapping(value = "myinterests.do", method = RequestMethod.GET)
		public String interestsView(@ModelAttribute StockVO vo, Model model, HttpSession session) {
			UserVO member = (UserVO)session.getAttribute("member");
				
			//로그인 세션 확인
			if(member!=null) {//id가 비어있지 않으면 if문 실행.
				System.out.println("관심상품 보기..");
				vo.setMemberId(member.getMemberId());
				int memberNum = stockService.getMemberNum(member.getMemberId());
				List<StockVO> listVO = stockService.getInterestInfo(memberNum);
				//System.out.println(listVO.get(0));
					
				//view단에 vo객체를 넘겨준다.
				model.addAttribute("stocklist", listVO);
				session.setAttribute("iseq", listVO.size());
				session.setAttribute("sessionInterests", listVO);
				
				return "/main/interests";
			};
			System.out.println("세션정보없음, 로그인페이지 이동...");
				return "main/login";

			}
		
		//관심상품 담기
		@RequestMapping(value = "getInterests.do", method = RequestMethod.GET)
		public void getInterests(@ModelAttribute StockVO vo, Model model, HttpSession session) {
			UserVO member = (UserVO)session.getAttribute("member");
				
			//멤버 정보 탐색
			if(member==null) {
				System.out.println("세션정보 없음...");
				return;
			};
			vo.setMemberNum(member.getMemberNum());
			//관심상품 DB와 연동
			stockService.getInterests(vo);
		}
		
		@RequestMapping(value = "getBaskets.do", method = RequestMethod.GET)
		public void getBaskets(@ModelAttribute StockVO vo, Model model, HttpSession session) {
			UserVO member = (UserVO)session.getAttribute("member");
				
			//멤버 정보 탐색
			if(member==null) {
				System.out.println("세션정보 없음...");
				return;
			};
			vo.setMemberNum(member.getMemberNum());
			//장바구니 DB와 연동
			stockService.insertBasketInfo(vo);
		}
		
		// 관심상품에서 장바구니로 옮기기 (관심상품 객체 삭제, 장바구니로 객체 이동)
		@RequestMapping(value = "interestToBaskets.do", method = RequestMethod.GET)
		public String moveBasket(@ModelAttribute("stock") StockVO vo, Model model, HttpSession session) { // 받을 땐 stock vo로, 보낼 땐 model로
			System.out.println("관심상품 장바구니로 옮기기...");
			System.out.println(vo);
		
			// 관심상품 삭제 후 장바구니 추가하는 메서드
			UserVO member = (UserVO)session.getAttribute("member");
			vo.setMemberNum(member.getMemberNum());
			
			// 관심상품 제거 메서드 
			System.out.println(vo);
			stockService.deleteInterests(vo);
			
			// 장바구니 추가
			System.out.println(vo);
			stockService.insertBasketInfo(vo);
			
			return "redirect:baskets.do";
			};
			
		
		//장바구니 (이동/...)
		@RequestMapping(value = "baskets.do", method = RequestMethod.GET)
		public String basketView(@ModelAttribute("stock") StockVO vo, Model model, HttpSession session) {
			//System.out.println(item);
			UserVO member = (UserVO)session.getAttribute("member");
			
			//로그인 세션 확인
			if(member==null) { //id가 비어있으면 로그인 화면으로 이동
			System.out.println("세션정보없음, 로그인페이지 이동...");
			return "main/login";
			}
			
			System.out.println("장바구니 보기..");
			List<StockVO> listVO = stockService.getBasketInfo(member.getMemberNum()); // getBasketInfo 만들어주기
			
			if (!listVO.isEmpty()) {
				System.out.println(listVO.get(0));
				//view단에 vo객체를 넘겨준다.
				model.addAttribute("stock", listVO);
				model.addAttribute("sessionStock", listVO);
				session.setAttribute("bseq", listVO.size());
			} else {
				model.addAttribute("stock", null);
			}
			
			
			return "/main/baskets";
			};

}
