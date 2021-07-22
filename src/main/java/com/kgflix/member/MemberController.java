package com.kgflix.member;

import java.lang.reflect.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.kgflix.member.dao.MemberDAO;
import com.kgflix.member.vo.MemberVO;

import lombok.Cleanup;


@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;
	 
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String strart(RedirectAttributes reAttr) {
			
		return "redirect:/main";
	}// 시작과 동시에 메인페이지로 전환

	@RequestMapping(value = "/main", method = RequestMethod.GET)
		public String mainpage(Model model) {
			return "mainpage";
		}

	@RequestMapping(value="/mainpage", method=RequestMethod.GET)
	public String mainPage() {
		return "mainpage";
		
	}
	@RequestMapping(value="/mainpage", method=RequestMethod.POST)
	public String mainPage(@RequestParam ("member") MemberVO member,SessionAttribute session) {
		
		return "mainpage";
		
	}
		
	@RequestMapping(value="/loginpage",method=RequestMethod.GET)
		public String loginpage(Model model) {
			model.addAttribute("loginmessage","");
			
			return "loginpage";
		}

	@RequestMapping("/logout")
	public String logout(@SessionAttribute ("member") MemberVO member,WebRequest req) {
		req.removeAttribute("member",WebRequest.SCOPE_SESSION); //session scope에 저장되어져 있는 member정보를 삭제
		return "redirect:/main";
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST) 
		 public String loginStart(@RequestParam ("id") String id, @RequestParam("pw") String pw ,HttpSession session) { 
			MemberVO member=dao.login(id, pw); 
				if (member!=null) {		
					session.setAttribute("member",member); //객체 생성해서 넘겨줌.
					return "redirect:/main";
				}else {
					session.setAttribute("loginfail","로그인 실패 비밀번호를 확인해주세요");
			    	return "loginpage";
			 	}
		}
	

	@RequestMapping(value = "/joinpage", method = RequestMethod.GET)
	public String joinStart(Model model1) {
		model1.addAttribute("pwwarning", "비밀번호를 확인해주세요");
		model1.addAttribute("emailwarning", "");
		return "joinpage";
	}

	@RequestMapping(value = "/joinpage", method = RequestMethod.POST)
	public String joinpage(Model model1) {
		return "joinpage";
	}

	@RequestMapping(value = "/joinmember", method = RequestMethod.POST)
	public String joinmember(HttpServletRequest req, Model model1) {
		/* MemberVO member= new MemberVO(); */
		String  id=req.getParameter("id");
		String pw=req.getParameter("pw");
		String name=req.getParameter("name");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		dao.insertMember(id,pw,name,tel,email);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/checkIdExist", method = RequestMethod.POST)
	public String checkIdExist(Model model1, HttpServletRequest req) {
		String memberid = req.getParameter("id");
		MemberVO mvo = null;
		mvo=dao.getMembInfo(memberid);
		model1.addAttribute(mvo);
		return "joinmember";

		// 중복아이디체크
	}
	
	@RequestMapping(value = "/findID")
	public String findID() {
		return "findID";// 아이디찾기 페이지
	}

	@RequestMapping(value = "/findPW")
	public String findPW() {
		return "findPW";
		// 비번찾기 페이지
	}


	@RequestMapping(value = "/myinfo", method = RequestMethod.POST)
	public String myinfo(@SessionAttribute ("member") MemberVO member) {
		
		return "myinfo";
	}

	
	@RequestMapping("/updateMembInfo")
	public String updateMembInfo(HttpServletRequest req,@SessionAttribute("member") MemberVO member) {
		String pw=req.getParameter("newPW1");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		member.setPw(pw);	
		member.setTel(tel);
		member.setEmail(email);
		dao.updateMembInfo(member);
		
		return "redirect:/myinfo";
	}
	
	

	@RequestMapping(value = "/orderpage", method = RequestMethod.GET)
	public String orderpage() {
		return "orderpage";

	}
	
	@RequestMapping(value="/deleteMembInfo", method=RequestMethod.POST)
	public String deleteMembInfo(HttpSession session) {
		session.setAttribute("member",null);// 회원탈퇴를 한 후 로그인했던 정보를 삭제해 준다.
		return "redirect:/main";//main화면으로 이동
	}
	
	

}
