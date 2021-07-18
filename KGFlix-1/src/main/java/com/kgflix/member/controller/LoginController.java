/*
 * package com.kgflix.member.controller;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RestController;
 * 
 * import com.kgflix.member.logindao.loginDAO;
 * 
 * @RestController public class LoginController {
 * 
 * @Autowired loginDAO logindao;
 * 
 * @GetMapping("/login") public String getPW(HttpServletRequest req) { String
 * result="fail"; String memId=""; String memPw="";
 * memId=req.getParameter("id"); memPw=req.getParameter("pw"); if(
 * logindao.getPw(memId)!= null&&(logindao.getPw(memId))==memPw) {
 * result="login success"; } return result; }
 * 
 * }
 */