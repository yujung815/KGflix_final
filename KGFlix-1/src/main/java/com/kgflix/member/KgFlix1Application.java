package com.kgflix.member;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClient;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EnableDiscoveryClient
@LoadBalancerClient
@MapperScan(basePackages = "com.company.kgflix") 
public class KgFlix1Application {

	@Bean
	public static void main(String[] args) {
		SpringApplication.run(KgFlix1Application.class, args);
	}

}
