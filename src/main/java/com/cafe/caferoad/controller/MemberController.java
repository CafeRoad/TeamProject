package com.cafe.caferoad.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	
	@RequestMapping("/member/join")
	String showJoin() {
		return "/member/join";
	}
}
