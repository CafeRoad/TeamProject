package com.sql.cafe.controller;


import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sql.cafe.service.NoticeService;
import com.sql.cafe.vo.NoticeVO;

@Controller

public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/showNoticeForm", method = RequestMethod.GET)
	public String showNoticeForm(Model model) {
		logger.info("noticeForm");
		model.addAttribute("noticeVOWrite", new NoticeVO());
		return "/noticeWriteForm";
		
	}
	
	@RequestMapping(value = "/notice/noticeWriteAction", method = RequestMethod.POST)
	public String noticeAction(@ModelAttribute("newNoticeVO") @Valid) {
		logger.info("noticeWriteAction");
		noticeService.insertNotice(noticeVOWrite);
		return "/noticeListForm";
	}
	
}
