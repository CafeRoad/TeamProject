package com.sql.cafe.cafe;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sql.cafe.HomeController;

@Controller
public class CafeController {

	@Autowired
	private CafeService cafeService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 카페 등록 폼으로 이동.
	@RequestMapping(value = "/cafe/signUp", method = RequestMethod.GET)
	public String signUp(Model model) {

		logger.info("signUp called!");

		// VO 만들면서 가입 폼으로.
		model.addAttribute("waitingCafeVO", new CafeVO());
		model.addAttribute("waitingCafeOptionVO", new Cafe_optionVO());

		return "cafe/signUpForm";
	}

	// 카페 등록 동작.
	@RequestMapping(value = "/cafe/signUpAction", method = RequestMethod.POST)
	public String signUpAction(@ModelAttribute("waitingCafeVO") @Valid CafeVO cafeVO,
			@ModelAttribute("waitingCafeOptionVO") @Valid Cafe_optionVO cafe_optionVO, BindingResult bidingResult,
			Model model, RedirectAttributes rttr) throws Exception {

		logger.info(" cafe/signUpAction called!");

		if (bidingResult.hasErrors()) {
			System.out.println("----------------------------error----------------------------");
			List<ObjectError> list = bidingResult.getAllErrors();
			for (ObjectError e : list) {
				logger.error("ObjectError : " + e.toString() + "\n");
			}
			// 에러가 있으면 돌려보냄.
			model.addAttribute("waitingCafeVO", cafeVO);
			model.addAttribute("waitingCafeOptionVO", cafe_optionVO);
		} else {
			// added_cafe 두 테이블에 인서트.
			cafeService.insertNewCafe(cafeVO, cafe_optionVO);

			rttr.addFlashAttribute("msg", "등록이 완료되었습니다. 관리자 승인 후 등록된 카페 목록을 확인할 수 있습니다.");
			// 마이페이지로..? 신청충인 카페 보는 뷰도 만들어야 함.
			return "redirect:/checkEmail";

		}
		return "cafe/signUpForm";
	}
}
