package com.kgflix.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	
	@RequestMapping(value="/joinpage", method=RequestMethod.GET)
	public String joinstart(Model model1) {
		model1.addAttribute("pwwarning","");
		model1.addAttribute("emailwarning","");
		
		return "joinpage";
	}
	
	@RequestMapping(value="/joinpage", method=RequestMethod.POST )
	public String joingpage() {
		
		return "joinpage";
	}

	@RequestMapping(value="/joinmember", method=RequestMethod.POST)
	public String joinmember() {
			
		return "loginpage";
	}
	@RequestMapping(value="/checkIdExist", method=RequestMethod.POST)
	public String checkIdExist(Model model1, HttpServletRequest req) {
		req.getParameter("id");
		boolean result=true;
		//아이디 중복확인하는 서비스 거쳐서 결과값 받아 넣기
		if (result==true)
		{
			model1.addAttribute("result","사용할 수 있는 아이디 입니다.");
			model1.addAttribute("id",req.getParameter("id"));
		}
		else {
			model1.addAttribute("result","이미 존재하는 아이디 입니다.");
			model1.addAttribute("id",req.getParameter(""));
		}
		
		return "";//중복아이디체크
	}
	@RequestMapping(value="/findID")
	public String findID() {
		return "findID";//아이디찾기 페이지
	}
	@RequestMapping(value="/findPW")
	public String findPW() {
		return "findPW";//비번찾기 페이지
	}
	
	@RequestMapping(value="/myinfo", method=RequestMethod.GET)
	public <memeberVO> String myinfo(Model model1, memeberVO mvo) {
		model1.addAttribute("member",mvo);
		return "myinfo";
		
	}
}
