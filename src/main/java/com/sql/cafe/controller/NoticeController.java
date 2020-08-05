
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

	@RequestMapping(value = "/notice/noticeWriteAction", method = RequestMethod.POST)
	public String noticeWriteAction(@ModelAttribute("newNoticeVO") @Valid NoticeVO newNoticeVO,
			BindingResult bidingResult, Model model, String notice_id, @SessionAttribute MemberVO signedMember,
			RedirectAttributes rttr) throws Exception {

		logger.info("/review/noticeWriteAction called!");

		System.out.println("notice_id" + notice_id);
		System.out.println("NoticeVO.getNotice_id" + newNoticeVO.getNotice_id());

		if (bidingResult.hasErrors()) {
			System.out.println("----------------------------error----------------------------");
			List<ObjectError> list = bidingResult.getAllErrors();
			for (ObjectError e : list) {
				logger.error("ObjectError : " + e.toString() + "\n");
			} // 에러가 있으면돌려보냄.
			model.addAttribute("newNoticeVO", newNoticeVO);
		} else {
			newNoticeVO.setAdmin_id(signedMember.getId());

			newNoticeVO.setNotice_id(Integer.parseInt(notice_id)); //
			// noticeService.insertNotice(newNoticeVO);

			rttr.addFlashAttribute("msg", "리뷰가 등록되었습니다.");
			// 마이페이지로..? 신청충인 카페 보는 뷰도만들어야 함.
			return "redirect:/cafe/getSpecificCafe?notice_id=" + notice_id;

		}
		return "redirect:/cafe/getSpecificCafe?notice_id=" + notice_id;
	}

}
