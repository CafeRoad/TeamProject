package com.sql.cafe.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

	@Autowired
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

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

//	@RequestMapping(value = "/getMember", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome getUser! The client locale is {}.", locale);
//
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//
//		String formattedDate = dateFormat.format(date);
//		String id = "totoro";
//
//		model.addAttribute("serverTime", formattedDate);
//		model.addAttribute("member", memberService.SelectMemberById(id));
//
//		return "memberTableTest";
//	}

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(Model model) {

		logger.info("signUp called!");

		model.addAttribute("signUpMemberVO", new MemberVO());

		return "signUpForm";
	}

	// 회원가입.
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

//		boardService.insertBoard(boardBean);
//		model.addAttribute("totalCnt", new Integer(boardService.getTotalCnt()));
//		model.addAttribute("current_page", "1");
//		model.addAttribute("boardList", boardService.getList(1, 2));
//		return "board/listSpecificPage";
//		
//		
//
//		
//		//
//		logger.info("Welcome userEmailConfirm!");
//
//		if (authkey == null) {
//			rttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
//			return "redirect:/";
//		}
//
//		MemberVO member = memberService.updateToUser(authkey);
//		if (member == null) {
//			rttr.addFlashAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
//			return "redirect:/";
//		}
//		model.addAttribute("user", member);
			rttr.addFlashAttribute("msg", "가입시 사용한 이메일로 인증해주세요.");
			return "redirect:/";

		}
		return "signUpForm";
	}

	@RequestMapping(value = "/userEmailConfirm", method = RequestMethod.GET)
	public String userEmailConfirm(@RequestParam("authKey") String authkey, Model model, RedirectAttributes rttr)
			throws Exception {

		logger.info("Welcome userEmailConfirm!");

		if (authkey == null) {
			rttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
			return "redirect:/";
		}
		System.out.println("여기서 나?");
		MemberVO memberVO = memberService.updateToUser(authkey);
		System.out.println("업데이트 쿼리 오류");
		if (memberVO == null) {
			rttr.addFlashAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";
		}

		model.addAttribute("memberVO", memberVO);
		return "emailOK";

	}
//	로그인 동작에서의 뭘까
//    @RequestMapping(value = "/sign-up", method = RequestMethod.GET)
//    public String regist() throws Exception {
//        return SIGN_UP_VIEW;
//    }
// 
//    @RequestMapping(value = "/sign-up", method = RequestMethod.POST)
//    public String regist(MemberDTO user, RedirectAttributes rttr) throws Exception{
//    
//        System.out.println("regesterPost 진입 ");
//        memberSvc.regist(user);
//        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
//        return HOME;
//    }

}
