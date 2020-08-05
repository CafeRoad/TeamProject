
package com.sql.cafe.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sql.cafe.service.NoticeService;
import com.sql.cafe.vo.MemberVO;
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

		model.addAttribute("newNoticeVO", new NoticeVO());
		model.addAttribute("content", "notice/noticeWriteForm");
		return "main";
	}
	// 노티스 글 쓰는 동작.
	@RequestMapping(value = "/notice/noticeWriteAction", method = RequestMethod.POST)
	public String noticeWriteAction(@ModelAttribute("newNoticeVO") @Valid NoticeVO newNoticeVO, BindingResult bidingResult,
			Model model, @SessionAttribute MemberVO signedMember, RedirectAttributes rttr)
			throws Exception {

		logger.info("/notice/noticeWriteAction called!");


		if (bidingResult.hasErrors()) {
			System.out.println("----------------------------error----------------------------");
			List<ObjectError> list = bidingResult.getAllErrors();
			for (ObjectError e : list) {
				logger.error("ObjectError : " + e.toString() + "\n");
			} // 에러가 있으면돌려보냄.
			model.addAttribute("newNoticeVO", newNoticeVO);
			model.addAttribute("content", "notice/noticeWriteForm");
		} else {
			newNoticeVO.setAdmin_id(signedMember.getId());
			newNoticeVO.setPassword("12312");
			noticeService.insertNotice(newNoticeVO);

			rttr.addFlashAttribute("msg", "공지가 등록되었습니다.");
			model.addAttribute("content", "notice/noticeListForm");
			return "main";
		}
		return "main";
	}

}
