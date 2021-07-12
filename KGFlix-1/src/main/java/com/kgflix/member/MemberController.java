package com.kgflix.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgflix.member.dao.MemberDAO;

@Controller
public class MemberController {
	@Autowired MemberDAO dao;
	
	@RequestMapping("/")
	public String strart() {
		return "redirect:/main";
	}//시작과 동시에 메인페이지로 전환
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/loginpage")
	public String loginpage() {
		return "loginpage";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginStart(@RequestParam ("id") String id,@RequestParam("pw") String pw,Model model1) {
		
		return"";
	}
	
	
	@RequestMapping(value="/joinpage", method=RequestMethod.GET)
	public String joinStart(Model model1) {
		//model1.addAttribute("pwwarning","비밀번호를 확인해주세요");
		//model1.addAttribute("emailwarning","");
		
		return "joinpage";
	}
	
	@RequestMapping(value="/joinpage", method=RequestMethod.POST )
	public String joingpage(Model model1) {
		//model1.addAttribute("pwwarning","비밀번호가 다릅니다.");
		//model1.addAttribute("emailwarning","이메일형식을 확인해주세요.");
		
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
	
	
	
	@RequestMapping(value="/orderpage",method=RequestMethod.GET)
	public String orderpage() {
		return "orderpage";
	}
	
	
	
}
