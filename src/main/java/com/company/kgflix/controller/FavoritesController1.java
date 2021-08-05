package com.company.kgflix.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.kgflix.dao.FavoritesDAO;
import com.company.kgflix.dao.FavoritesFreeDAO;
import com.company.kgflix.vo.FavoritesFreeVO;
import com.company.kgflix.vo.FavoritesVO;
import com.company.kgflix.vo.MemberVO;
import com.company.kgflix.vo.login_searchVO;
import com.company.kgflix.vo.payVO;
import com.netflix.discovery.converters.Auto;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class FavoritesController1 {
	
	
	private int subs;
	private int free;
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	FavoritesDAO dao;
	
	@Autowired
	FavoritesFreeDAO freeDao;

	
	
	@RequestMapping("/favoritesInsert")
	public String insertFavorites(@RequestParam("con_no") String con_no,
			Model model	) {
		
		int videoCon_no = Integer.parseInt(con_no);
		session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		if(mvo.getId()==null) {
			
			return "redirect:/insertFail";
		}
		
		
		dao.insertFavorites(mvo.getId(), videoCon_no);
		
		return "redirect:/favoritesMain";
	}
	
	@RequestMapping(value = "/insertFail")
	public String insertFail(Model model) {

		model.addAttribute("msg", "미가입 회원은 이용할수 없습니다.");
		model.addAttribute("url", "failInsert");

		return "/favorites/insertFailPage";
	}
	
	@RequestMapping(value = "/failInsert")
	public String failInsert() {
		
		return "/search/search";	
	}
	
	@RequestMapping("/favoritesMain")
	public String favoritesGetAll(Model model) {
		session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		
		model.addAttribute(dao.getAllInfo(mvo.getId()));

		subs = FavoritesVO.getSubs();
	
		return "/favorites/favoritesMainPage";
	}
	
	@RequestMapping("/delete")
	public String deleteFavorites(@RequestParam("deleteCon_no") String deleteCon_no) {
		session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		dao.deleteFavorites(mvo.getId(),deleteCon_no);
		
		return "redirect:/favoritesMain";
	}
	
	@RequestMapping(value="/loginFavoritesMain")
	public String getLoginFavoritesMain(@RequestParam("userId") String id, Model model) {
		MemberVO mvo = restTemplate.getForObject("http://main-service/rest_cs", MemberVO.class);
		payVO pvo = restTemplate.getForObject("http://main-service/searchDate",payVO.class);
		if (mvo != null) {
			session = req.getSession();
			session.setAttribute("member", mvo);
			session.setAttribute("pvo", pvo);
		}
	
		
		model.addAttribute(dao.getAllInfo(mvo.getId()));
		
		return "/favorites/favoritesMainPage";
	

 }
	
	@RequestMapping("/myPlay")
	public String play(@RequestParam ("con_no") String con_no, 
            RedirectAttributes redirectAttributes, Model model) {

		int NumCon_no = Integer.parseInt(con_no);
		
	 model.addAttribute(freeDao.getFree(NumCon_no));
	 free = FavoritesFreeVO.getFree();
	 
	 	session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		model.addAttribute(dao.getAllInfo(mvo.getId()));

		subs = FavoritesVO.getSubs();
	 
		redirectAttributes.addAttribute("con_no", con_no);
		
		return "redirect:/favoritesPlay";
	}

	@RequestMapping(value = "/playFail")
	public String playFail(Model model) {

		model.addAttribute("msg", "유료 컨텐츠 입니다. "
				+ "결제 후 이용하세요");
		model.addAttribute("url", "research");

		return "/favorites/playFailPage";
	}
	@RequestMapping(value = "/research")
	public String playFailPage() {

		return "redirect:/search";
	
	}
	
	@RequestMapping(value="/order")
	public String orderController(RedirectAttributes redirect,HttpServletRequest request) {
		String redirectUrl = request.getScheme()+"://localhost:8763/order";
		
		return  "redirect:"+redirectUrl;
	}
	
}