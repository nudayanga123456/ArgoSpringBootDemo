package com.example.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
	
	@Value("${greet.message}")
	private String greeet_string;
	
	@GetMapping("/greet")
	public String greet() {
		return "Message : "+greeet_string;
	}
}
