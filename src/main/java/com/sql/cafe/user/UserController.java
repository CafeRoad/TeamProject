package com.sql.cafe.user;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sql.cafe.HomeController;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/getUser", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome getUser! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		String user_id = "totoro";
		
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("user", userService.getSpecificRow(user_id));
		
		return "userTableTest";
	}
}
