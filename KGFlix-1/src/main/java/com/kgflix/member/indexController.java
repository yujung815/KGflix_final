package com.kgflix.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {
	
	@GetMapping("/")
	public String start() {
		return "redirect:/main";
	}
	
	@GetMapping("/loginpage")
	public String loginpage() {
		return "loginpage";
	}

}
