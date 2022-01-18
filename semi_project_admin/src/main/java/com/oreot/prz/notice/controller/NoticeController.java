package com.oreot.prz.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.oreot.admin.notice.dao.NoticeVO;
import com.oreot.admin.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	private static final String FILE_PATH = "C:\\workspace\\semiProject\\semi_project\\src\\main\\webapp\\noticeUpload/";

	@RequestMapping("notice.do")
	public String goAdminNotice(Model model, NoticeVO vo, HttpSession session){
		System.out.println("공지사항 화면 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword(""); // String 빈 문자열로 초기화
		}
		
		List<NoticeVO> list = noticeService.getNoticeList(vo);
		
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("noticeList", list);
		
		return "admin/adminNotice";
	}
	
	@RequestMapping("popup/noticeDetail.do")
	public String goNoticeInfoDetailModal(Model model, NoticeVO vo, HttpSession session){
		System.out.println("공지사항 상세보기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		NoticeVO notice = noticeService.getNoticeInfo(vo);
		model.addAttribute("notice", notice);
		
		return "modal/noticeDetailModal";
	}
	
	@RequestMapping("popup/noticeUpdateForm.do")
	public String goNoticeInfoUpdateModal(Model model, NoticeVO vo, HttpSession session){
		System.out.println("공지사항 수정하기 모달 이동..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		NoticeVO notice = noticeService.getNoticeInfo(vo);
		model.addAttribute("notice", notice);
		
		return "modal/noticeUpdateModal";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "updatenotice.do", method = RequestMethod.POST)
	public String updateMemberProc(NoticeVO vo, HttpSession session) throws IOException {
		System.out.println("공지사항 수정 처리.");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(FILE_PATH+fileName));
			vo.setNoticePhoto(fileName);
		}else {
			vo.setNoticePhoto("");
		}
		
		noticeService.updateNotice(vo);
			
		return "redirect:notice.do";
	}
		
	
	// 글 등록 처리
	@RequestMapping(value = "insertnotice.do", method = RequestMethod.POST)
	public String insertBoardProc(NoticeVO vo, HttpSession session) throws IOException {
		System.out.println("공지사항 등록 처리..");
		
		if(session.getAttribute("memberNum") == null) {
			return "redirect:login.do";
		}
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(FILE_PATH+fileName));
			vo.setNoticePhoto(fileName);
		} else {
			vo.setNoticePhoto("");
		}
		
		noticeService.insertNotice(vo);
				
		return "redirect:notice.do";
	}
	
	@RequestMapping("noticeFileDownload.do")
	public void noticeFileDownload(HttpServletResponse response, NoticeVO vo) throws Exception {
    	
		File file = new File(FILE_PATH+vo.getNoticePhoto());
    	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
    	
    	FileInputStream fileInputStream = new FileInputStream(FILE_PATH+vo.getNoticePhoto()); // 파일 읽어오기 
    	OutputStream out = response.getOutputStream();
    	
    	int read = 0;
        byte[] buffer = new byte[1024];
        while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
            out.write(buffer, 0, read);
        }
    }
	
}
