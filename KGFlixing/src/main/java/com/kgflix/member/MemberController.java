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

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kgflix.member.dao.MemberDAO;
import com.kgflix.member.dao.WishDAO;
import com.kgflix.member.dao.payDAO;
import com.kgflix.member.vo.MemberVO;
import com.kgflix.member.vo.login_searchVO;
import com.kgflix.member.vo.payVO;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@Autowired
	payDAO pdao;

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest req;
	
	@Autowired
	WishDAO wdao;

	@GetMapping("/")
	public String mainpage() {

		application = req.getServletContext();
		if (application.getAttribute("lsvo") != null) {
			application.removeAttribute("lsvo");
		}

		return "mainpage";
	}

	@GetMapping("/mainpage")
	public String mainPage() {
		return "mainpage";

	}

	@PostMapping("/mainpage")
	public String mainPage(@RequestParam("member") MemberVO member) {

		return "mainpage";

	}

	@GetMapping("/loginpage")
	public String loginpage(Model model) {
		model.addAttribute("loginmessage", "");

		return "loginpage";
	}

	@GetMapping("/logout")
	public String logout(WebRequest wreq) {
		application = req.getServletContext();
		application.removeAttribute("member");
		application.removeAttribute("pdao");
		return "redirect:/";
	}

	@PostMapping("/login")
	public String loginStart(String id, String pw, RedirectAttributes red) {


		MemberVO member = null;

		if (dao.login(id, pw) != null) {
			member = dao.login(id, pw);
			if (member.getId().equals("root")) {
				return "move/move_admin";

			} else if (dao.status(member.getId()) == 1) {
				red.addFlashAttribute("msg", "stop");

				return "redirect:/loginpage";

			} else {
				application.setAttribute("member", member); // 객체 생성해서 넘겨줌.
				payVO pvo = pdao.getInfo(id);
				application.setAttribute("pvo", pvo); 
				return "redirect:/";
			}
		} else {
			red.addFlashAttribute("msg","fail");
			return "redirect:/loginpage";
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
	public String joinmember(String id , String pw , String name , String tel ,String email) {
		MemberVO mvo = new MemberVO(id,pw,name,tel,email);
		dao.insertMember(mvo);
		return "redirect:/mainpage";
	}

	@GetMapping("/findID")
	public String findID() {
		return "findID";// 아이디찾기 페이지
	}

	@PostMapping("/findIdAtion")
	@ResponseBody
	public Map<String, Object> findIdAcrion(String name, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = dao.findId(name, email);

		if (id != null) {
			map.put("result", id);
		} else {
			map.put("result", "fail");
		}

		return map;
	}

	@GetMapping("/findPW")
	public String findPW() {
		return "findPW";
		// 비번찾기 페이지
	}

	@PostMapping("/findPwAtion")
	@ResponseBody
	public Map<String, Object> findPwAtion(String name, String id, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		String pw = dao.findPw(name, id, email);

		if (pw != null) {
			map.put("result", pw);
		} else {
			map.put("result", "fail");
		}

		return map;
	}

	@GetMapping("/myinfo")
	public String myinfo() {

		return "myinfo";
	}

	@ResponseBody
	@PostMapping("/checkId")
	public Map<String, Object> checkId(String id) {

		Map<String, Object> map = new HashMap<String, Object>();
		int check = dao.checkOverId(id);

		if (check != 1) {
			map.put("result", "suc");
		} else {
			map.put("result", "fail");
		}

		return map;
	}

	@PostMapping("/updateMembInfo")
	public String updateMembInfo(String id , String newPW1 , String tel , String email) {
		MemberVO mvo = new MemberVO(id, newPW1, tel, email);
		dao.updateMembInfo(mvo);
		application = req.getServletContext();
		application.removeAttribute("member");
		MemberVO mvo2 = dao.getMembInfo(id);
		application.setAttribute("member", mvo2);
		return "redirect:/myinfo";
	}

	@GetMapping("/orderpage")
	public String orderpage() {
		return "orderpage";

	}

	@GetMapping("/deleteMembInfo")
	public String deleteMembInfo() {
		application = req.getServletContext();
		MemberVO mvo = (MemberVO)application.getAttribute("member");
		dao.deleteMembInfo(mvo.getId());
		application.removeAttribute("member");
		application.removeAttribute("pdao");
		pdao.delete(mvo.getId());
		wdao.delete(mvo.getId());
		
		return "redirect:/mainpage";// main화면으로 이동
	}

	@GetMapping("/search")
	public String search() {

		String searchItem = req.getParameter("searchItem");

		application = req.getServletContext();

		MemberVO mvo = (MemberVO) application.getAttribute("member");
		login_searchVO lsvo = new login_searchVO(mvo, searchItem);
		application.setAttribute("lsvo", lsvo);
		return "move/move_search";
	}

	@GetMapping("/cs")
	public String cs() {

		return "move/move_cs";
	}

	@GetMapping("/close")
	public void close() {
		application = req.getServletContext();
		application.removeAttribute("member");
	}

	@RequestMapping("/order")
	public String orderPage() {

		return "orderPage";
	}

	@RequestMapping(value = "/pay")
	public String payPage(Model model , RedirectAttributes red) {
		application = req.getServletContext();
		MemberVO mvo =  (MemberVO) application.getAttribute("member");
		model.addAttribute("id",mvo.getId());
		model.addAttribute("price","4900");
		if(pdao.getInfo(mvo.getId())!=null) {
			return "move/alert";
		}
		return "payPage";
	}

	@RequestMapping(value = "/payFail")
	public String payFail(Model model) {

		model.addAttribute("msg", "결제 정보가 다릅니다.");
		model.addAttribute("url", "order");

		return "payFailPage";
	}

	@RequestMapping(value = "/subsPayFail")
	public String subsPayFail(Model model) {

		model.addAttribute("msg", "이미 결제가 완료된 회원입니다.");
		model.addAttribute("url", "mainpage");

		return "payFailPage";
	}

	@RequestMapping(value = "/managerPayFail")
	public String managerPayFail(Model model) {

		model.addAttribute("msg", "안녕하세요 관리자님");
		model.addAttribute("url", "mainpage");

		return "payFailPage";
	}

	@RequestMapping(value = "/paySuccess")
	public String paySuccess(HttpServletRequest request, Model model) {
		application = req.getServletContext();
		MemberVO mvo =  (MemberVO) application.getAttribute("member");
		dao.changeSubs(mvo.getId());
		pdao.insert(mvo.getId());
		
		application.removeAttribute("member");
		application.removeAttribute("pvo");
		
		MemberVO member = dao.getMembInfo(mvo.getId());
		application.setAttribute("member", member); // 객체 생성해서 넘겨줌.
		payVO pvo = pdao.getInfo(mvo.getId());
		application.setAttribute("pvo", pvo); 

		model.addAttribute("msg", "결제가 완료되었습니다.");
		model.addAttribute("url", "return");

		return "paySuccessPage";
	}

	@RequestMapping(value = "/return")
	public String returnMainPage() {

		return "redirect:/";
	}

	@RequestMapping(value = "/myFavoritesMain")
	public String favoritesMain(RedirectAttributes redirect, HttpServletRequest request) {
		String redirectUrl = request.getScheme() + "://localhost:8766/loginFavoritesMain";
		application = req.getServletContext();
		MemberVO mvo = (MemberVO)application.getAttribute("member");
			
		redirect.addAttribute("userId", mvo.getId());

		return "redirect:" + redirectUrl;

	}

}
