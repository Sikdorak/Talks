package com.sold.spring.talks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AlertController {
	
	@GetMapping("/alert")
	public String Alert() {
		return "alert";
	}

}
