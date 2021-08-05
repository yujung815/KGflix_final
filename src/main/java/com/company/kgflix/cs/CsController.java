package com.company.kgflix.cs;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.kgflix.cs.dao.CsDAO;
import com.company.kgflix.cs.vo.CsVO;
import com.company.kgflix.cs.vo.MemberVO;

@Controller
public class CsController {

	@Autowired
	CsDAO dao;

	@Autowired
	HttpServletRequest req;

	@Autowired
	RestTemplate restTemplate;

	@Autowired
	HttpSession session;

	@RequestMapping("/")
	public String index() {
		try {
			MemberVO mvo = restTemplate.getForObject("http://main-service/rest_cs", MemberVO.class);
			if (mvo != null) {
				session = req.getSession();
				session.setAttribute("userInfo", mvo);
			}
		} catch (Exception e) {
		}

		return "redirect:/cs_main";
	}

	@RequestMapping("/cs_main")
	public String main() {
		return "cs_main";
	}

	@RequestMapping("/writeForm") // 1:1문의 insertform
	public String writeForm() {
		return "/writeForm";
	}

	@PostMapping("/write") // insertinfo
	public String insertinfo(CsVO cvo, RedirectAttributes red) {
		dao.insertInfo(cvo);
		red.addAttribute("user_no", cvo.getUser_no());

		return "redirect:/list";

	}

	@GetMapping("/list") // 1:1 문의 리스트
	public String list(Model model, String user_no) {
		if (user_no.equals("비회원") == false) {
			ArrayList<CsVO> list = dao.list(user_no);
			model.addAttribute("list", list);
			return "list"; // .jsp
		} else {
			return "cs_main";
		}
	}

	@RequestMapping("/list2") // 1:1 문의 내용보기 수정
	public String view(Model model1 , int cs_no) {
		model1.addAttribute("vo", dao.list2(cs_no));
		return "list2"; 
	}

	@RequestMapping("/deleteinfo")
	public String delete(int cs_no , String user_no , RedirectAttributes red) {
		red.addAttribute("user_no", user_no);
		dao.deleteInfo(cs_no);
		return "redirect:list";
	}

}