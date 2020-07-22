package com.sql.cafe.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sql.cafe.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardservice;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/board")
	public String boardView() {
		return "/include/contents/board";
	}
	
	@RequestMapping(value = "/board/write.do")
	public String write() {
		return "/board/write";
	}

}
