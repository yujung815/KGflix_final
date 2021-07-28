package com.kgflix.member;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kgflix.member.dao.MemberDAO;
import com.kgflix.member.vo.MemberVO;


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
	

	@RequestMapping("/logout")
	public String logout(@SessionAttribute ("member") MemberVO member,WebRequest req) {
		req.removeAttribute("member",WebRequest.SCOPE_SESSION); //session scope에 저장되어져 있는 member정보를 삭제
		return "redirect:/main";
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
		String email=(req.getParameter("email").toString());
		dao.insertMember(id,pw,name,tel,email);
		return "redirect:/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkSignup",method=RequestMethod.POST)
	public String checkSignup(HttpServletRequest request, Model model,MemberDAO dao) {
		String id=request.getParameter("id");
		int rowcount=dao.idExist(id);
		model.addAttribute("data",rowcount);
		return String.valueOf(rowcount);
	}

	
	@RequestMapping(value = "/findID" ,method=RequestMethod.GET)
	public String openfindId() {
		return "findID";
	}
	
	@RequestMapping(value = "/findID" ,method=RequestMethod.POST)
	public String findID(@RequestParam ("name") String name,
				@RequestParam ("email") String email, MemberVO member) {
		member=dao.findId(name,email);
		return "loginpage";
	}

	@RequestMapping(value = "/findPW", method=RequestMethod.GET)
	public String openfindPw() {
		return "findPW";
	}
	
	@RequestMapping(value = "/findPW", method=RequestMethod.POST)
	public String findPW(@RequestParam ("name") String name,@RequestParam ("id") String id,
						@RequestParam ("email") String email,MemberVO member,Model model) {
		String result="findPW";	
		member.setName(name);
		member.setId(id);
		member.setEmail(email);
		member=dao.getMembInfo(id);
		if(member.getName().equals(name)&&member.getEmail().equals(email)) {
			model.addAttribute(member);
			result="resetPw";
		}
		return result;
		// 비번찾기 페이지
	}

	@RequestMapping(value = "/myinfo")
	public String myinfo(@SessionAttribute ("member") MemberVO member) {
		return "myinfo";
	}

	@RequestMapping(value="/updateMembInfo",method=RequestMethod.POST)
	public String updateMembInfo(HttpServletRequest req,@SessionAttribute("member") MemberVO member) {
		String pw=req.getParameter("pw");
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
		MemberVO member=(MemberVO) session.getAttribute("member");
		dao.deleteMembInfo(member.getId());
		session.setAttribute("member",null);// 회원탈퇴를 한 후 로그인했던 정보를 삭제해 준다.
		return "redirect:/main";//main화면으로 이동
	}

}
