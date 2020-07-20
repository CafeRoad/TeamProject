package com.cafe.caferoad.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cafe.caferoad.service.LoginService;
import com.cafe.caferoad.vo.MemberVO;

@Controller
public class LoginController {
	@Autowired
	LoginService service;

	@RequestMapping(value = "/member/login.do")
	public String loginView() {
		return "/member/login";
	}

	@RequestMapping(value = "/member/loginpro.do", method = RequestMethod.POST)
	public ModelAndView loginPro(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		String status = service.loginPro(vo, session);
		ModelAndView mav = new ModelAndView();
		if (status == null) {
			System.out.println("로그인 실패");
			mav.setViewName("login");
			mav.addObject("msg", "error");
		} else if (status.equals("1")) {
			mav.setViewName("home");
		} else {
			mav.setViewName("adminhome");
		}
		return mav;
	}

}
