package com.cafe.caferoad.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "home.do")
	public String homeView() {
		return "home";
	}

}
