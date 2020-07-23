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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sql.cafe.service.MemberService;
import com.sql.cafe.vo.MemberVO;

@Controller
@SessionAttributes("signedMember")
public class MemberController {

	// 멤버 테이블과 관련된. 회원가입, 로그인 등의 기능이 들어가는 컨트롤러.

	@Autowired
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 회원가입 폼으로 이동.
	@RequestMapping(value = "/joinChoice", method = RequestMethod.GET)
	public String joinChoice(Model model) {

		logger.info("signUp called!");

		// VO 만들면서 가입 폼으로.
		model.addAttribute("signUpMemberVO", new MemberVO());
		model.addAttribute("content", "member/joinChoice");
		return "main";
	}
	
	// 회원가입 유저 폼으로 이동.
	@RequestMapping(value = "/joinUser", method = RequestMethod.GET)
	public String joinUser(Model model) {

		logger.info("signUp called!");

		// VO 만들면서 가입 폼으로.
		model.addAttribute("signUpMemberVO", new MemberVO());
		model.addAttribute("content", "member/signUpForm_user");
		return "main";
	}
	
	
	// 회원가입 오너 폼으로 이동.
	@RequestMapping(value = "/joinOwner", method = RequestMethod.GET)
	public String joinOwner(Model model) {

		logger.info("signUp called!");

		// VO 만들면서 가입 폼으로.
		model.addAttribute("signUpMemberVO", new MemberVO());
		model.addAttribute("content", "member/signUpForm_owner");
		return "main";
	}
	
	
	// 회원가입 유저동작.
	@RequestMapping(value = "/userSignUpAction", method = RequestMethod.POST)
	public String userSignUpAction(@ModelAttribute("signUpMemberVO") @Valid MemberVO signUpMemberVO, BindingResult bidingResult,
			Model model, RedirectAttributes rttr) throws Exception {

		logger.info(" signUpAction called!");

		if (bidingResult.hasErrors()) {
			System.out.println("----------------------------error----------------------------");

			List<ObjectError> list = bidingResult.getAllErrors();

			for (ObjectError e : list) {
				logger.error("ObjectError : " + e.toString() + "\n");

			}
			// 에러가 있으면 돌려보냄. 문구 띄워야 함.
			model.addAttribute("signUpMemberVO", signUpMemberVO);
		} else {

			// 에러가 없으면 Authority는 난수로 설정하고 insert.
			memberService.insertNewMemberToUser(signUpMemberVO);

			rttr.addFlashAttribute("msg", "가입시 사용한 이메일로 인증해주세요.");
			// 가입되었고 이메일 인증하라는 폼을 만들어서 수정해야 함.
			model.addAttribute("content", "member/checkEmailPlease");
			return "main";

		}
		return "redirect:/signUp";
	}
	
	// 회원가입 오너동작.
		@RequestMapping(value = "/ownerSignUpAction", method = RequestMethod.POST)
		public String ownerSignUpAction(@ModelAttribute("signUpMemberVO") @Valid MemberVO signUpMemberVO, BindingResult bidingResult,
				Model model, RedirectAttributes rttr) throws Exception {

			logger.info(" signUpAction called!");

			if (bidingResult.hasErrors()) {
				System.out.println("----------------------------error----------------------------");

				List<ObjectError> list = bidingResult.getAllErrors();

				for (ObjectError e : list) {
					logger.error("ObjectError : " + e.toString() + "\n");

				}
				// 에러가 있으면 돌려보냄. 문구 띄워야 함.
				model.addAttribute("signUpMemberVO", signUpMemberVO);
			} else {

				// 에러가 없으면 Authority는 난수로 설정하고 insert.
				memberService.insertNewMemberToOwner(signUpMemberVO);

				rttr.addFlashAttribute("msg", "가입시 사용한 이메일로 인증해주세요.");
				// 가입되었고 이메일 인증하라는 폼을 만들어서 수정해야 함.
				model.addAttribute("content", "member/checkEmailPlease");
				return "redirect:/main";

			}
			return "redirect:/signUp";
		}
	

	// 인증 코드를 보낸 메일에서 접근. Authority 값 USER로 변환.
	@RequestMapping(value = "/userEmailConfirm", method = RequestMethod.GET)
	public String userEmailConfirm(@RequestParam("authKey") String authkey, Model model, RedirectAttributes rttr)
			throws Exception {

		logger.info("Welcome userEmailConfirm!");

		if (authkey == null) {
			rttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
			// 에러페이지를 만들어서 보낼 필요.
			return "redirect:/main";
		}
		MemberVO memberVO = memberService.updateToUser(authkey);
		if (memberVO == null) {
			rttr.addFlashAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
			// 에러페이지를 만들어서 보낼 필요.
			return "redirect:/main";
		}

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("content", "member/emailOK");
		return "main";

	}
	
	
	// 인증 코드를 보낸 메일에서 접근. Authority 값 OWNER로 변환.
		@RequestMapping(value = "/ownerEmailConfirm", method = RequestMethod.GET)
		public String ownerEmailConfirm(@RequestParam("authKey") String authkey, Model model, RedirectAttributes rttr)
				throws Exception {

			logger.info("Welcome ownerEmailConfirm!");

			if (authkey == null) {
				rttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
				// 에러페이지를 만들어서 보낼 필요.
				return "redirect:/main";
			}
			MemberVO memberVO = memberService.updateToOwner(authkey);
			if (memberVO == null) {
				rttr.addFlashAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
				// 에러페이지를 만들어서 보낼 필요.
				return "redirect:/main";
			}

			model.addAttribute("memberVO", memberVO);
			model.addAttribute("content", "member/emailOK");
			return "main";

		}

	// 로그인 하는 폼으로 이동.
	@RequestMapping(value = "/login")
	public String login(Model model) {
		model.addAttribute("memberVO", new MemberVO());
		model.addAttribute("content", "member/loginForm");
		return "main";
	}

	// 로그인 동작. id와 password를 받아서 둘 다 일치하는 행을 검색 후 VO담아서 리턴.
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(@ModelAttribute("memberVO") @Valid MemberVO memberVO, @RequestParam("id") String id,
			@RequestParam("password") String password, Model model) {
		logger.info("Welcome loginAction!");

		// 정보를 페이지 단위가 아닌 세션으로 넣어야 함.
		model.addAttribute("signedMember", memberService.login(id, password));
		// redirect를 해야 주소창도 바뀜.
		
		return "redirect:/main";
	}
	
	//로그아웃.
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, SessionStatus sessionStatus) {

		// 세션의 상태를 클리어.
		sessionStatus.setComplete();

		// 알러트? 팝업? 메세지를 띄울 필요는 있는 듯.
		// rttr.addFlashAttribute("msg", "로그아웃 되었습니다.");

		return "redirect:/main";
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model) {
		model.addAttribute("content", "member/info");
		return "main";
	}
	
	//회원탈퇴.
	@RequestMapping(value = "/deleteForm", method = RequestMethod.GET)
	public String delete(Model model, @SessionAttribute MemberVO signedMember) {
		signedMember.setPassword(null);
		model.addAttribute("content", "member/deleteForm");
		return "main";
		
	}
	
	// 로그인 동작. id와 password를 받아서 둘 다 일치하는 행을 검색 후 VO담아서 리턴.
	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
	public String deleteAction(@ModelAttribute("signedMember") @Valid MemberVO signedMember,
		@RequestParam("id") String id, @RequestParam("password") String password, Model model, SessionStatus sessionStatus) {
		logger.info("Welcome deleteAction!");

		sessionStatus.setComplete();
		// 정보를 페이지 단위가 아닌 세션으로 넣어야 함.
		model.addAttribute("signedMember", memberService.delete(id, password));
		// redirect를 해야 주소창도 바뀜.
		return "redirect:/main";
	}

}
