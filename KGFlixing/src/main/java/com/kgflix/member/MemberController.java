package com.kgflix.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kgflix.member.dao.MemberDAO;
import com.kgflix.member.vo.MemberVO;
import com.kgflix.member.vo.login_searchVO;



@Controller
public class MemberController {
	@Autowired
	MemberDAO dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpServletRequest req;

	@GetMapping("/")
	public String mainpage() {
		
	   application = req.getServletContext();
	   if(application.getAttribute("lsvo") != null) {
		   login_searchVO lsvo = (login_searchVO) application.getAttribute("lsvo");
		   MemberVO mvo = lsvo.getMvo();
		   session = req.getSession();
		   session.setAttribute("member", mvo);
		   application.removeAttribute("lsvo");
	   }else if (application.getAttribute("mvo") != null) {
		   MemberVO mvo = (MemberVO) application.getAttribute("mvo");
		   session = req.getSession();
		   session.setAttribute("member", mvo);
		   application.removeAttribute("mvo");
	   }
		
		return "mainpage";
	}

	@GetMapping("/mainpage")
	public String mainPage() {
		return "mainpage";

	}

	@PostMapping("/mainpage")
	public String mainPage(@RequestParam("member") MemberVO member, SessionAttribute session) {

		return "mainpage";

	}

	@GetMapping("/loginpage")
	public String loginpage(Model model) {
		model.addAttribute("loginmessage", "");

		return "loginpage";
	}

	@GetMapping("/logout")
	public String logout(@SessionAttribute("member") MemberVO member, WebRequest wreq) {
		wreq.removeAttribute("member", WebRequest.SCOPE_SESSION); // session scope에 저장되어져 있는 member정보를 삭제
		return "redirect:/";
	}

	@PostMapping("/login")
	public String loginStart(@RequestParam("id") String id, @RequestParam("pw") String pw) {
		MemberVO member = dao.login(id, pw);
		if (member != null) {
			session.setAttribute("member", member); // 객체 생성해서 넘겨줌.
			return "redirect:/";
		} else {
			session.setAttribute("loginfail", "로그인 실패 비밀번호를 확인해주세요");
			return "loginpage";
		}
	}

	@GetMapping("/joinpage")
	public String joinStart(Model model1) {
		model1.addAttribute("pwwarning", "비밀번호를 확인해주세요");
		model1.addAttribute("emailwarning", "");
		return "joinpage";
	}

	@PostMapping("/joinpage")
	public String joinpage() {
		return "joinpage";
	}

	@PostMapping("/joinmember")
	public String joinmember(MemberVO mvo) {
		
		dao.insertMember(mvo);
		return "redirect:/mainpage";
	}


	@GetMapping("/findID")
	public String findID() {
		return "findID";// 아이디찾기 페이지
	}

	@GetMapping("/findPW")
	public String findPW() {
		return "findPW";
		// 비번찾기 페이지
	}

	@PostMapping("/myinfo")
	public String myinfo() {

		return "myinfo";
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public Map<String,Object> checkId(String id){

		Map<String,Object> map = new HashMap<String, Object>();
		int check = dao.checkOverId(id);

		if(check != 1) {
			map.put("result","suc");
		}else {
			map.put("result","fail");
		}

		return map;
	}
	

	@PostMapping("/updateMembInfo")
	public String updateMembInfo(@SessionAttribute("member") MemberVO member) {
		String pw = req.getParameter("newPW1");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		member.setPw(pw);
		member.setTel(tel);
		member.setEmail(email);
		dao.updateMembInfo(member);

		return "redirect:/myinfo";
	}

	@GetMapping("/orderpage")
	public String orderpage() {
		return "orderpage";

	}

	@PostMapping("/deleteMembInfo")
	public String deleteMembInfo() {
		session.setAttribute("member", null);// 회원탈퇴를 한 후 로그인했던 정보를 삭제해 준다.
		return "redirect:/main";// main화면으로 이동
	}

	@GetMapping("/search")
	public String search() {

		String searchItem = req.getParameter("searchItem");
		
		application = req.getServletContext();
		session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		login_searchVO lsvo = new login_searchVO(mvo,searchItem);
		application.setAttribute("lsvo", lsvo);
		return "move/move_search";
	}
	
	@GetMapping("/cs")
	public String cs() {
		
		session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		if(mvo != null) {
			application.setAttribute("mvo", mvo);
		}
		return "move/move_cs";
	}

	
}
