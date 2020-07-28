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

import com.sql.cafe.service.ReviewService;
import com.sql.cafe.vo.CafeVO;
import com.sql.cafe.vo.MemberVO;
import com.sql.cafe.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	// 리뷰 등록 동작.
	@RequestMapping(value = "/review/writeAction", method = RequestMethod.POST)
	public String writeAction(@ModelAttribute("newReviewVO") @Valid ReviewVO newReviewVO, BindingResult bidingResult,
			Model model, String cafe_id, @SessionAttribute MemberVO signedMember, RedirectAttributes rttr)
			throws Exception {

		logger.info("/review/writeAction called!");

		System.out.println("cafe_id" + cafe_id);
		System.out.println("ReviewVO.getCafe_id" + newReviewVO.getCafe_id());

		if (bidingResult.hasErrors()) {
			System.out.println("----------------------------error----------------------------");
			List<ObjectError> list = bidingResult.getAllErrors();
			for (ObjectError e : list) {
				logger.error("ObjectError : " + e.toString() + "\n");
			}
			// 에러가 있으면 돌려보냄.
			model.addAttribute("newReviewVO", newReviewVO);
		} else {
			newReviewVO.setUser_id(signedMember.getId());

			newReviewVO.setCafe_id(Integer.parseInt(cafe_id));
			reviewService.insertIntoReview(newReviewVO);

			rttr.addFlashAttribute("msg", "리뷰가 등록되었습니다.");
			// 마이페이지로..? 신청충인 카페 보는 뷰도 만들어야 함.
			return "redirect:/cafe/getSpecificCafe?cafe_id=" + cafe_id;

		}
		return "redirect:/cafe/getSpecificCafe?cafe_id=" + cafe_id;
	}

}
