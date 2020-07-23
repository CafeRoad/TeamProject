package com.sql.cafe.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sql.cafe.service.BoardService;
import com.sql.cafe.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardservice;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public String wirteView(Model model) {
		logger.info("writeView");
		model.addAttribute("ObjToWrite", new BoardVO());
		return "/board/writeView";
	}

	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO vo) throws Exception {
		logger.info("write");
		boardservice.insertWrite(vo);
		return "redirect:/";
	}

}
