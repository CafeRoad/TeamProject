package com.sql.cafe.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sql.cafe.HomeController;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 특정 한 유저의 정보를 겟.
	@RequestMapping(value = "/getMember", method = RequestMethod.GET)
	public String getmember(Locale locale, Model model) {
		logger.info("Welcome getUser! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		String id = "totoro";

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("member", memberService.SelectMemberById(id));

		return "memberTableTest";
	}
	
	// 회원가입 폼으로 이동.
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(Model model) {

		logger.info("signUp called!");

		model.addAttribute("signUpMemberVO", new MemberVO());

		return "signUpForm";
	}

	// 회원가입 동작.
	@RequestMapping(value = "/signUpAction", method = RequestMethod.POST)
	public String signUpAction(@ModelAttribute("signUpMemberVO") @Valid MemberVO memberVO, BindingResult bidingResult,
			Model model, RedirectAttributes rttr) throws Exception {

		logger.info(" signUpAction called!");

		if (bidingResult.hasErrors()) {
			System.out.println("----------------------------error----------------------------");

			List<ObjectError> list = bidingResult.getAllErrors();

			for (ObjectError e : list) {
				logger.error("ObjectError : " + e.toString() + "\n");

			}
			// 에러가 있으면 돌려보냄.
			model.addAttribute("member", memberVO);
		} else {

			memberService.insertNewMember(memberVO);

			rttr.addFlashAttribute("msg", "가입시 사용한 이메일로 인증해주세요.");
			return "redirect:/";

		}
		return "signUpForm";
	}

	// 인증 코드를 보낸 메일에서 접근. Authority 값 USER로 변환.
	@RequestMapping(value = "/userEmailConfirm", method = RequestMethod.GET)
	public String userEmailConfirm(@RequestParam("authKey") String authkey, Model model, RedirectAttributes rttr)
			throws Exception {

		logger.info("Welcome userEmailConfirm!");

		if (authkey == null) {
			rttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
			return "redirect:/";
		}
		MemberVO memberVO = memberService.updateToUser(authkey);
		if (memberVO == null) {
			rttr.addFlashAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";
		}

		model.addAttribute("memberVO", memberVO);
		return "emailOK";

	}
	
	// 이하 영운씨꺼 땡겨옴. 수정필.

//	@RequestMapping(value = "/member/login.do")
//	public String loginView() {
//		return "/member/login";
//	}
//
//	@RequestMapping(value = "/member/loginpro.do", method = RequestMethod.POST)
//	public ModelAndView loginPro(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
//		String status = service.loginPro(vo, session);
//		ModelAndView mav = new ModelAndView();
//		if (status == null) {
//			System.out.println("로그인 실패");
//			mav.setViewName("login");
//			mav.addObject("msg", "error");
//		} else if (status.equals("1")) {
//			mav.setViewName("home");
//		} else {
//			mav.setViewName("adminhome");
//		}
//		return mav;
//	}

}
