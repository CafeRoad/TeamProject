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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sql.cafe.service.CafeService;
import com.sql.cafe.vo.CafeVO;
import com.sql.cafe.vo.MemberVO;

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
		model.addAttribute("content", "cafe/addCafeForm");
		return "main";
	}

	// 카페 등록 동작.
	@RequestMapping(value = "/cafe/signUpAction", method = RequestMethod.POST)
	public String signUpAction(@ModelAttribute("waitingCafeVO") @Valid CafeVO waitingCafeVO, BindingResult bidingResult,
			Model model,@SessionAttribute MemberVO signedMember, RedirectAttributes rttr) throws Exception {

		logger.info(" cafe/signUpAction called!");

		if (bidingResult.hasErrors()) {
			System.out.println("----------------------------error----------------------------");
			List<ObjectError> list = bidingResult.getAllErrors();
			for (ObjectError e : list) {
				logger.error("ObjectError : " + e.toString() + "\n");
			}
			// 에러가 있으면 돌려보냄.
			model.addAttribute("waitingCafeVO", waitingCafeVO);
			model.addAttribute("content", "cafe/addCafeForm");
		} else {
			
			String owner_id = signedMember.getId();
			waitingCafeVO.setOwner_id(owner_id);
			// waiting_cafe 두 테이블에 인서트.
			cafeService.insertNewCafe(waitingCafeVO);

			rttr.addFlashAttribute("msg", "등록이 완료되었습니다. 관리자 승인 후 등록된 카페 목록을 확인할 수 있습니다.");
			// 마이페이지로..? 신청충인 카페 보는 뷰도 만들어야 함.
			return "redirect:/searchMyWatingCafes";

		}
		return "/cafe/signUp";
	}

	// 오너가 내 승인 대기중인 카페 리스트를 뽑음.
	@RequestMapping(value = "/searchMyWaitingCafes", method = RequestMethod.GET)
	public String searchMyWatingCafes(Model model, @SessionAttribute MemberVO signedMember) {

		String owner_id = signedMember.getId();
		model.addAttribute("CafeList", cafeService.selectWaitingCafesByOwnerId(owner_id));
		//
		model.addAttribute("content", "member/myWaitingCafeInfo");
		return "main";
	}

	// 승인을 위해 승인 대기중인 모든 카페의 리스트를 겟.
	@RequestMapping(value = "/searchWaitingCafes", method = RequestMethod.GET)
	public String searchWaitingCafes(Model model) {
		
		model.addAttribute("CafeList", cafeService.selectWaitingCafes());
		
		// 어드민이 카페의 리스트를 보는 페이지.
		// 그냥 리스트를 잘 재활용해도 되지 않을까..?
		model.addAttribute("content", "member/myWaitingCafeInfo");
		return "main";
	}
	
	// 승인을 위해, 승인대기중인 리스트에서 특정 카페 보기로 이동.
	@RequestMapping(value = "/searchSpecificWaitingCafe", method = RequestMethod.GET)
	public String searchSpecificWaitingCafe(Model model, @RequestParam("cafe_id") String cafe_id) {
		
		model.addAttribute("specificCafe", cafeService.searchSpecificWaitingCafe(cafe_id));
		
		// 특정 카페의 정보를 보는 페이지로 이동. 웨이팅 카페고, 어드민이면 승인버튼이 보이게.
		model.addAttribute("content", "특정 카페 페이지 만들어서 넣어야 함.");
		return "main";
	}
	

	// 특정 대기중 카페 보기에서 버틀 눌러 카페 승인하기.
	@RequestMapping(value = "/approveCafeAction", method = RequestMethod.GET)
	public String myPage(Model model, @RequestParam("cafe_id") String cafe_id) {

		int approved = cafeService.approveCafe(cafe_id);
		System.out.println("승인되어 added cafe로 들어간 카페 수 : "+approved);
		// 특정 카페 승인 이후, 다시 승인대기 중인 카페의 리스트로 이동.
		return "redirect:/searchWaitingCafes";
	}

	// 승인된 카페의 리스트를 뽑음.
	@RequestMapping(value = "/searchMyAddedCafes", method = RequestMethod.GET)
	public String myPage(Model model, @SessionAttribute MemberVO signedMember) {

		String owner_id = signedMember.getId();
		model.addAttribute("CafeList", cafeService.selectAddedCafesByOwnerId(owner_id));
		model.addAttribute("content", "member/myAddedCafeInfo");
		return "main";
	}

	// 접속한 유저의 아이디로 즐겨찾기한 카페 리스트 반환.
	@RequestMapping(value = "/myPavoriteCafe", method = RequestMethod.GET)
	public String myPavoriteCafe(Model model, @SessionAttribute MemberVO signedMember) {

		String user_id = signedMember.getId();

		model.addAttribute("cafeList", cafeService.myFavoriteCafes(user_id));
		model.addAttribute("content", "페이지 만들어서 넣어야 함.");

		return "main";

	}
	
	// 즐겨찾기 버튼을 눌러 즐겨찾기 테이블로.
	@RequestMapping(value = "/intoFavoriteAction", method = RequestMethod.GET)
	public String intoFavoriteAction(Model model, @SessionAttribute MemberVO signedMember,  @RequestParam("cafe_id") String cafe_id) {
		
		String user_id = signedMember.getId();
		int added = cafeService.toFavorite(user_id, cafe_id);
		if(added != 1) {
			
			// 즐겨찾기에 등록이 실패하였습니다.
		}
		
		// 알러트로 실패하면 알릴 필요는 있음.
		// 페이지 이동은 하지 않음.
		return null;
	}
		
	// 다시 즐겨찾기 버튼을 눌러서 즐겨찾기 테이블에서 삭제.
	@RequestMapping(value = "/deleteFavoriteAction", method = RequestMethod.GET)
	public String deleteFavoriteAction(Model model, @SessionAttribute MemberVO signedMember,  @RequestParam("cafe_id") String cafe_id) {
		
		String user_id = signedMember.getId();
		int added = cafeService.deleteFavorite(user_id, cafe_id);
		if(added != 1) {
			
			// 즐겨찾기 취소가 실패하였습니다.
		}
		
		// 알러트로 실패하면 알릴 필요는 있음.
		// 페이지 이동은 하지 않음.
		return null;
	}
		
}
