package com.sql.cafe.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	HttpServletRequest request;

	// 현재 view를 확인하기 위한 기능들이 들어가 있음. 수정되면 다른 컨트롤러로 옮겨야 함.
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("banner_full", "True");

		return "main";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String include(Model model) {
		logger.info("Welcome include!");

		model.addAttribute("banner_full", "True");
		return "main";
	}

}
