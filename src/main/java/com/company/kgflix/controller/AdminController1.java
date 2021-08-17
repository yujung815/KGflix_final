package com.company.kgflix.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.kgflix.dao.ContentDAO;
import com.company.kgflix.dao.CsDAO;
import com.company.kgflix.dao.UserDAO;
import com.company.kgflix.service.UploadService;
import com.company.kgflix.vo.ContentVO;
import com.company.kgflix.vo.payVO;


@Controller
public class AdminController1 {
	
	@Autowired
	UserDAO user_dao;
	
	@Autowired
	CsDAO cs_dao;
	
	@Autowired
	ContentDAO content_dao;
	
	@Autowired
	UploadService uploadService;
	
	@Autowired
	RestTemplate restTemplate;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest req;
	
	
	//메인 페이지 열기
	@RequestMapping("/")
	public String ad_main() {
		payVO pvo = restTemplate.getForObject("http://main-service/searchDate",payVO.class);
		session.setAttribute("pvo", pvo);
		return "admin/ad_main"; 
	}
	
	//회원관리 페이지 열기, 회원전체 출력
	@RequestMapping("/ad_member")
	public String ad_member(Model model1) {
		
		model1.addAttribute("ad_member", user_dao.allinfo());
		
		return "admin/ad_member";
	}
	
	
	
	
	//회원 이용 정지
	@RequestMapping("/user_status1")  //이용정지
	public String status1(HttpServletRequest req1, Model model1) {
		String id =req1.getParameter("id");
		user_dao.updateStatus1(id);
		return "redirect:ad_member";
	}
	@RequestMapping("/user_status2")  //이용정지 취소
	public String status2(HttpServletRequest req1, Model model1) {
		String id =req1.getParameter("id");
		user_dao.updateStatus2(id);
		return "redirect:ad_member";
	}
	
	
	//회원 삭제
	@RequestMapping("/deleteuser")
	public String delete(HttpServletRequest req1) {
		String id=req1.getParameter("id");
		user_dao.deleteUser(id);
		return "redirect:ad_member";
	}
	
	
	//1:1 문의관리 열기, 문의전체 출력
	@RequestMapping("/ad_cs")
	public String ad_cs(Model model1) {
		model1.addAttribute("ad_cs", cs_dao.Ad_cs());
		return "admin/ad_cs"; 
	}
	
	//1:1 문의관리의 상태 변경
	@RequestMapping("/cs_status")
	public String  cs_status(HttpServletRequest req1, Model model1) {
		String cs_no = req1.getParameter("cs_no");
		String status = req1.getParameter("status");
		cs_dao.updateStatus(cs_no, status);
		return "redirect:ad_cs";
	}
	
	
	//영상등록 페이지열기
	@RequestMapping("/ad_videoInsert")
	public String ad_videoInsert() {
		return "admin/ad_videoInsert"; 
	}
	
	@PostMapping("uploadAction")
	public String uploadAction(@RequestParam("video") MultipartFile video , @RequestParam("thumb") MultipartFile thumb
				, HttpServletRequest req , RedirectAttributes red) throws IllegalStateException, IOException {
		int new_no = 0;
		int pop = 0;
		int free =0;
		if(req.getParameter("new_no") != null) {
			new_no = 1;
		}
		if(req.getParameter("pop") != null) {
			pop = 1;
		}
		if(req.getParameter("free") != null) {
			free = 1;
		}
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		uploadService.excute(new_no , pop , free , title ,category ,  video , thumb);
		red.addFlashAttribute("msg","suc");
		return "redirect:/ad_videoInsert"; 
	}
	
	//영상 삭제하기
	   @RequestMapping("/deleteContent")
	   public String deleteContent(HttpServletRequest req1) {
	      String con_no = req1.getParameter("con_no");
	      uploadService.delete(con_no);
	      content_dao.deleteContent(con_no);
	      
	      return "redirect:ad_videoSearch";
	   }
	   
	 //영상수정/삭제 페이지열기
	   @RequestMapping("/ad_videoSearch")
	   public String ad_videoSearch(Model model1) {
	      model1.addAttribute("ad_videoSearch", content_dao.Ad_videoSearch());
	      return "admin/ad_videoSearch"; 
	   }
	   
	 //영상상세 페이지열기
	   @RequestMapping("/ad_detail")
	   public String ad_datail(HttpServletRequest req1, Model model1) {
	      String con_no = req1.getParameter("con_no");
	      model1.addAttribute("vo",content_dao.getInfo(con_no));
	      return "admin/ad_videoDetail"; 
	   }
	   
	 //영상수정 페이지열기
		@RequestMapping("/ad_videoUpdate")
		public String ad_videoUpdate(HttpServletRequest req1, Model model1) {
			String con_no = req1.getParameter("con_no");
		    model1.addAttribute("vo",content_dao.getInfo(con_no));
			/* model1.addAttribute("vo",content_dao.getInfo(category)); */
			return "admin/ad_videoUpdate"; 
		}
		
	//영상 수정하기
		@RequestMapping("/updateinfo") 
		public String updateinfo(HttpServletRequest req1, Model model1) { 
			String con_no = req1.getParameter("con_no");
			String title = req1.getParameter("title"); 
			String category = req1.getParameter("category");
			int new_no = 0;
			int pop = 0;
			int free =0;
			if(req1.getParameter("new_no") != null) {
				new_no = 1;
			}
			if(req1.getParameter("pop") != null) {
				pop = 1;
			}
			if(req1.getParameter("free") != null) {
				free = 1;
			}
			content_dao.updateInfo(title,con_no,category,new_no,pop,free); 
			return "redirect:ad_videoSearch";		  
		  }
		 
	   
	 //영상 검색하기
	   @RequestMapping("/search2")
	      public String index2(Model model, HttpServletRequest req) {
	         ArrayList<ContentVO> search = null;

	         try {
	            String searchItem = req.getParameter("searchItem");
	            search = content_dao.getSearchInfo(searchItem);
	            model.addAttribute("search", search);
	            model.addAttribute("searchItem", searchItem);

	         } catch (Exception e) {
	           }

	         return "admin/ad_videoSearchResult";
	      }

}

