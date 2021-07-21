package com.kgflix.member;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

public class ServletInitializer extends SpringBootServletInitializer {
 
	@Override
	
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(KgFlix1Application.class);
	}

}
