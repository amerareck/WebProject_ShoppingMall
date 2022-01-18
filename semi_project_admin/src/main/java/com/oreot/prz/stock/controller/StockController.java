package com.oreot.prz.stock.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oreot.admin.stock.dao.StockVO;
import com.oreot.admin.stock.service.StockService;

@Controller
public class StockController {
	
	@Autowired
	StockService stockService;
	
	private static final String STOCK_MAIN_FILE_PATH = "C:\\workspace\\semiProject\\semi_project\\src\\main\\webapp\\stockMainUpload/";

	@RequestMapping("stockmanagement.do")
	public String goAdminStockManagement(Model model, StockVO vo, HttpSession session){
		System.out.println("제고관리 화면 이동");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		List<StockVO> list = stockService.getStockList();
		
		model.addAttribute("stockList", list);
		
		return "admin/adminStockManagement";
	}
	
	@RequestMapping("popup/stockInsert.do")
	public String goMemberInfoUpdateModal(Model model, StockVO vo, HttpSession session){
		System.out.println("상품 등록 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		List<StockVO> lcategories = stockService.getLcategories();
		model.addAttribute("lcategories", lcategories);
		
		return "modal/stockInsertModal";
	}
	
	// 소분류 정보 가져오기
	@RequestMapping(value="lcategoriesChange.do",method=RequestMethod.POST)
	@ResponseBody
	public List<StockVO> checkLcategoriesChange(StockVO vo){
		System.out.println("소분류 처리..");
		
		List<StockVO> scategories = stockService.getScategories(vo);
		
		return scategories;
	}
	
	// 소분류 정보 가져오기
	@RequestMapping(value="checkStockCode.do",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> checkStockCode(StockVO vo){
		System.out.println("상품코드 중복체크..");
		
		HashMap<String, String> result = new HashMap<String, String>();
		StockVO stock = stockService.getCheckStockCode(vo);
		
		if(stock.getCheckStockCode().equals("0")){ 
			result.put("result", "success");
		} else { 
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@RequestMapping(value = "stockInsertProc.do", method = RequestMethod.POST)
	public String stockInsertProc(Model model, StockVO vo, HttpSession session) throws IOException {
		System.out.println("상품 등록 및 옵션등록 페이지 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(STOCK_MAIN_FILE_PATH+fileName));
			vo.setStockPhoto(fileName);
		} else {
			vo.setStockPhoto("");
		}
		
		stockService.insertStock(vo);
		StockVO stock = stockService.getStockNumToStockCode(vo);
		
		model.addAttribute("stockNum", stock.getStockNum());
		
		return "modal/stockOptionInsertModal";
	}
	
	@RequestMapping(value = "stockOptionInsertProc.do", method = RequestMethod.POST)
	public String stockOptionInsertProc(Model model, StockVO vo, HttpSession session) throws IOException {
		System.out.println("상품 옵션 등록..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		stockService.insertStockOption(vo);
		
		model.addAttribute("stockNum", vo.getStockNum());
		
		return "modal/stockOptionInsertModal";
	}
	
	@RequestMapping(value = "popup/stockDetail.do", method = RequestMethod.POST)
	public String stockDetail(Model model, StockVO vo, HttpSession session) throws IOException {
		System.out.println("상품 상세보기 모달 페이지 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		StockVO stock = stockService.getStockInfo(vo);
		List<StockVO> option = stockService.getStockOptionInfo(vo);
		
		model.addAttribute("stock", stock);
		model.addAttribute("options", option);
		
		return "modal/stockInfoModal";
	}
	
	@RequestMapping("popup/stockUpdateForm.do")
	public String stockUpdateForm(Model model, StockVO vo, HttpSession session){
		System.out.println("상품 수정하기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		StockVO stock = stockService.getStockInfo(vo);
		List<StockVO> lcategories = stockService.getLcategories();
		List<StockVO> scategories = stockService.getScategories(stock);
		
		model.addAttribute("stock", stock);
		model.addAttribute("lcategories", lcategories);
		model.addAttribute("scategories", scategories);
		
		
		return "modal/stockUpdateModal";
	}
	
	@RequestMapping(value = "stockUpdateProc.do", method = RequestMethod.POST)
	public String stockUpdateProc(StockVO vo, HttpSession session) throws IOException {
		System.out.println("상품정보 수정 처리.");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(STOCK_MAIN_FILE_PATH+fileName));
			vo.setStockPhoto(fileName);
		}else {
			vo.setStockPhoto("");
		}
		
		stockService.updateStock(vo);
			
		return "redirect:stockmanagement.do";
	}
	
	@RequestMapping("popup/stockOptionUpdateForm.do")
	public String stockOptionUpdateForm(Model model, StockVO vo, HttpSession session){
		System.out.println("상품 옵션 수정하기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		StockVO option = stockService.getStockOptionInfoOne(vo);
		
		model.addAttribute("option", option);
		
		
		return "modal/stockOptionUpdateModal";
	}
	
	@RequestMapping(value = "stockOptionUpdateProc.do", method = RequestMethod.POST)
	public String stockOptionUpdateProc(StockVO vo, HttpSession session) throws IOException {
		System.out.println("상품 옵션 수정 처리.");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		stockService.updateStockOption(vo);
			
		return "redirect:stockmanagement.do";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "deleteStock.do", method = RequestMethod.POST)
	public String deleteStock(StockVO vo, HttpSession session) {
		System.out.println("상품 삭제 처리.");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		stockService.deleteStock(vo);
			
		return "redirect:stockmanagement.do";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "deleteStockOption.do", method = RequestMethod.POST)
	public String deleteStockOption(StockVO vo, HttpSession session) {
		System.out.println("상품 옵션 삭제 처리.");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		stockService.deleteStockOption(vo);
			
		return "redirect:stockmanagement.do";
	}
	
	@RequestMapping("stockMainFileDownload.do")
	public void stockMainFileDownload(HttpServletResponse response, StockVO vo) throws Exception {
    	
		File file = new File(STOCK_MAIN_FILE_PATH+vo.getStockPhoto());
    	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
    	
    	FileInputStream fileInputStream = new FileInputStream(STOCK_MAIN_FILE_PATH+vo.getStockPhoto()); // 파일 읽어오기 
    	OutputStream out = response.getOutputStream();
    	
    	int read = 0;
        byte[] buffer = new byte[1024];
        while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
            out.write(buffer, 0, read);
        }
    }
}
