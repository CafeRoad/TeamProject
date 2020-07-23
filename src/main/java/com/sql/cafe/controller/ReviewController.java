package com.sql.cafe.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sql.cafe.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService boardservice;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/board/board.do")
	public String boardView() {
		return "/board/board";
	}
	
	@RequestMapping(value = "/board/write.do")
	public String write() {
		return "/board/write";
	}

}
