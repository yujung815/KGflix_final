/*
 * package com.kgflix.member.controller;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.ResponseBody;
 * 
 * import com.kgflix.member.dao.MemberDAO;
 * 
 * @org.springframework.web.bind.annotation.RestController public class
 * RestController {
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value="/checkSignup",method=RequestMethod.POST) public String
 * checkSignup(HttpServletRequest request, Model model,MemberDAO dao) { String
 * id=request.getParameter("id"); int rowcount=dao.idExist(id); return
 * String.valueOf(rowcount); }
 * 
 * 
 * 
 * }
 * 
 * 
 * 
 * 
 */