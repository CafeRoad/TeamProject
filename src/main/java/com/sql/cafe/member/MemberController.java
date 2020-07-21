package com.sql.cafe.member;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sql.cafe.HomeController;

@Controller
public class MemberController {

	// 멤버 테이블과 관련된. 회원가입, 로그인 등의 기능이 들어가는 컨트롤러.

	@Autowired
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 특정 한 유저의 정보를 겟. 내부 기능 수정 필. 아이디를 변수로 받아와서 selelctMemberById의 인자로 넣어야 함. 생각해보니
	// 얜 그냥 확인용.
	@RequestMapping(value = "/getMember", method = RequestMethod.GET)
	public String getmember(Model model) {
		logger.info("Welcome getMember!");

		String id = "totoro";

		model.addAttribute("member", memberService.selectMemberById(id));

		return "memberTableTest";
	}

	// 회원가입 폼으로 이동.
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(Model model) {

		logger.info("signUp called!");

		// VO 만들면서 가입 폼으로.
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

			// 에러가 없으면 Authority는 난수로 설정하고 insert.
			memberService.insertNewMember(memberVO);

			rttr.addFlashAttribute("msg", "가입시 사용한 이메일로 인증해주세요.");
			// 가입되었고 이메일 인증하라는 폼을 만들어서 수정해야 함.
			return "redirect:/checkEmail";

		}
		return "signUpForm";
	}

	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
	public String checkEmail(Model model) {

		return "checkEmail";
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

	// 로그인 하는 폼으로 이동.
	@RequestMapping(value = "/login")
	public String login(Model model) {
		model.addAttribute("memberVO", new MemberVO());
		return "login";
	}

	// 로그인 동작. id와 password를 받아서 둘 다 일치하는 행을 검색 후 VO담아서 리턴.
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(@ModelAttribute("memberVO") @Valid MemberVO memberVO, @RequestParam("id") String id,
			@RequestParam("password") String password, Model model, HttpSession session) {
		logger.info("Welcome loginAction!");

		// 정보를 페이지 단위가 아닌 세션으로 넣어야 함.
		session.setAttribute("signedMember", memberService.login(id, password));

		return "main";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(MemberVO memberVO, Model model, HttpSession session) {

		// session.setAttribute("signedMember",null); 으로 해줘도 된다.
		session.invalidate();

		// 로그아웃 처리를 하고 index 메서드 호출하여 주소창도 바꾸면서 이동.
		return "redirect:/index";
	}

//	//로그인 처리. 근데 우리가 mav를 안써용..
//	@RequestMapping(value = "/member/loginpro.do", method = RequestMethod.POST)
//	public String loginPro(@ModelAttribute MemberVO vo, Model model) throws Exception {
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

//	@RequestMapping("/member/join")
//	String showJoin(Model model) {
//		
//		
//		return "/member/join";
//	}

}
