package com.kgflix.member;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kgflix.member.vo.MemberVO;
import com.kgflix.member.vo.login_searchVO;
import com.kgflix.member.vo.payVO;


@RestController
public class MemberControllerRest {
	

	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest req;

	@GetMapping("/rest_search")
	public login_searchVO search() {
		
		application = req.getServletContext();

		return (login_searchVO)application.getAttribute("lsvo");
	}
	
	@GetMapping("/searchDate")
	public payVO searchcDate() {
		application = req.getServletContext();
		return (payVO)application.getAttribute("pvo");
	}
	
	@GetMapping("/rest_cs")
	public MemberVO cs() {
		
		application = req.getServletContext();
		
		return (MemberVO)application.getAttribute("member");
	}
	
	@GetMapping("/rest_pay")
	public payVO rest_pay() {
		application = req.getServletContext();
		return (payVO)application.getAttribute("pvo");
	}
}
