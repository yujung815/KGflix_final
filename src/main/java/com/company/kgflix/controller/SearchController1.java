package com.company.kgflix.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.kgflix.dao.CommentDAO;
import com.company.kgflix.dao.ContentDAO;
import com.company.kgflix.vo.CommentVO;
import com.company.kgflix.vo.ContentVO;
import com.company.kgflix.vo.login_searchVO;

@Controller
public class SearchController1 {

	@Autowired
	ContentDAO content_dao;
	
	@Autowired
	CommentDAO comment_dao;
	
	ContentVO cvo = null;

	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest req;
	

	@RequestMapping("/send")
	public String search2(RedirectAttributes red ) {
		login_searchVO lsvo = restTemplate.getForObject("http://main-service/rest_search", login_searchVO.class);
		if(lsvo.getMvo() != null) {
			session = req.getSession();
			session.setAttribute("userInfo", lsvo.getMvo());
		}
		
		red.addAttribute("searchItem",lsvo.getSearchItem());
		
		return "redirect:/search";
	}
	@RequestMapping("/search")
	public String index(Model model,RedirectAttributes red) {
		ArrayList<ContentVO> search = null;

		try {
			String searchItem = req.getParameter("searchItem");
			String searchItem2 = (String)red.getAttribute("searchItem");
			
			if (searchItem == null) {
				search = content_dao.getSearchInfo(searchItem2);
			}else {
				search = content_dao.getSearchInfo(searchItem);
			}

			model.addAttribute("search", search);
			model.addAttribute("searchItem", searchItem);

		} catch (Exception e) {
		}

		return "/search/search";
	}

	@RequestMapping("/detailPage")
	public String detail(Model model) {
		String title = req.getParameter("title");
		title = title.replace("'", "");
		cvo = content_dao.getInfo(title);
		model.addAttribute("cvo", cvo);
		model.addAttribute("avg", comment_dao.score_avg(cvo.getCon_no()));

		return "/search/detailPage";
	}

	@RequestMapping("/play")
	public String play(Model model) {
		// video output
		String title = req.getParameter("title");
		title = title.replace("'", "");
		cvo = content_dao.getInfo(title);
		model.addAttribute("cvo", cvo);
		model.addAttribute("avg", comment_dao.score_avg(cvo.getCon_no()));
		// comment output
		ArrayList<CommentVO> comArr = comment_dao.search_content(cvo.getCon_no());
		model.addAttribute("comArr", comArr);

		return "/search/play";
	}

	@RequestMapping("/comment_del")
	public String comment_del(RedirectAttributes red) {

		String title = req.getParameter("title");
		red.addAttribute("title", title);

		String id = req.getParameter("id");
		id = id.replace("'", "");

		String con_no = req.getParameter("con_no");
		con_no = con_no.replace("'", "");
		int con_no2 = Integer.parseInt(con_no);
		comment_dao.delete_comment(con_no2, id);

		return "redirect:play";
	}

	@PostMapping("/comment_regist")
	public String comment_regist(RedirectAttributes red) {
		String title = req.getParameter("title");
		red.addAttribute("title", title);

		// 댓글입력 한 사람 정보와 콘텐츠 정보 받아오기
		int score = Integer.parseInt(req.getParameter("score"));
		int con_no = Integer.parseInt(req.getParameter("con_no"));
		String id = req.getParameter("id");
		String comment_user = req.getParameter("comment_user");

		// 중복확인작업
		boolean check = true;
		ArrayList<CommentVO> list = comment_dao.search_content(con_no);
		for (CommentVO cvo : list) {
			if (cvo.getId().equals(id)) {
				check = false;
				break;
			}
		}
		// check = true --> 중복된 아이디가 존재하지 않는다.
		if (check == true) {
			comment_dao.regist_comment(con_no, id, comment_user, score);
		} else { // check == false 인 경우 response객체를 통해 에러 내용을 전달한다
			red.addFlashAttribute("msg", "error");
		}
		return "redirect:play";
	}
	
	//카테고리 검색
    @RequestMapping("/search_cate")
    public String search_cate(HttpServletRequest req, Model model) {
       ArrayList<ContentVO> search= null;
       try {
          String category = req.getParameter("category");
          search = content_dao.Search_cate(category);
            model.addAttribute("searchItem",category);
             model.addAttribute("search", search);
          
       }catch (Exception e) {
       }
    
          return "search/search"; 
       }
}
