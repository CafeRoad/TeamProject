package com.sql.cafe.controller;

import javax.jws.WebParam.Mode;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sql.cafe.service.NoticeService;
import com.sql.cafe.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	
	
	// 공지사항으로 이동.
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model) {

		logger.info("noticeList called!");

		model.addAttribute("content", "notice/noticeListForm");
		return "main";
	}
	
	// 공지사항 글쓰기 폼 으로 이동.
	@RequestMapping(value = "/noticeWriteForm", method = RequestMethod.GET)
	public String noticeWirteForm(Model model) {

		logger.info("noticeWirteForm called!");
		model.addAttribute("noticeVOWrite", new NoticeVO());
		model.addAttribute("content", "notice/noticeWriteForm");
		return "main";
	}
	



//	@RequestMapping(value = "/notice/noticeWriteAction", method = RequestMethod.POST)
//	public String noticeAction(@ModelAttribute("newNoticeVO") @Valid) {
//		logger.info("noticeWriteAction");
//		noticeService.insertNotice(noticeVOWrite);
//		return "/noticeListForm";
//	}

}
