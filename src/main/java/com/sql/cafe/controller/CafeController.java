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
import com.sql.cafe.vo.ReviewVO;

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
			Model model, @SessionAttribute MemberVO signedMember, RedirectAttributes rttr) throws Exception {

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
			return "redirect:/searchMyWaitingCafes";

		}
		return "/cafe/signUp";
	}

	// 오너가 자신의 승인 대기중인 카페 리스트를 뽑음.
	@RequestMapping(value = "/searchMyWaitingCafes", method = RequestMethod.GET)
	public String searchMyWatingCafes(Model model, @SessionAttribute MemberVO signedMember) {

		String owner_id = signedMember.getId();
		model.addAttribute("CafeList", cafeService.selectWaitingCafesByOwnerId(owner_id));

		// 어드민이 특정 미승인 카페를 선택하는 창으로 옮겨야 함.
		model.addAttribute("signUpCafe", "카페 등록버튼 활성화");

		model.addAttribute("cafeListTitle", "내 승인대기 중인 카페");
		model.addAttribute("content", "cafe/cafeList");
		return "main";
	}

	// 오너가 자신의 승인된 카페의 리스트를 뽑음.
	@RequestMapping(value = "/searchMyAddedCafes", method = RequestMethod.GET)
	public String searchMyAddedCafes(Model model, @SessionAttribute MemberVO signedMember) {

		String owner_id = signedMember.getId();
		model.addAttribute("CafeList", cafeService.selectAddedCafesByOwnerId(owner_id));
		model.addAttribute("cafeListTitle", "내 승인된 카페");
		model.addAttribute("content", "cafe/cafeList");
		return "main";
	}

	// 어드민이 승인을 위해 승인 대기중인 모든 카페의 리스트를 겟.
	@RequestMapping(value = "/searchWaitingCafes", method = RequestMethod.GET)
	public String searchWaitingCafes(Model model) {

		model.addAttribute("CafeList", cafeService.selectWaitingCafes());

		model.addAttribute("cafeListTitle", "승인해야 할 카페");
		model.addAttribute("content", "cafe/cafeList");
		return "main";
	}

	// 특정 대기중 카페 보기에서 버틀 눌러 카페 승인하기.
	@RequestMapping(value = "/approveCafeAction", method = RequestMethod.GET)
	public String myPage(Model model, @RequestParam("cafe_id") String cafe_id) {

		int approved = cafeService.approveCafe(cafe_id);
		System.out.println("승인되어 added cafe로 들어간 카페 수 : " + approved);
		// 특정 카페 승인 이후, 다시 승인대기 중인 카페의 리스트로 이동.
		return "redirect:/searchWaitingCafes";
	}

	// 어드민이 승인된 모든 카페의 리스트를 겟.
	@RequestMapping(value = "/searchAddedCafes", method = RequestMethod.GET)
	public String searchAddedCafes(Model model) {

		// 결국엔 모든 카페 리스트.
		model.addAttribute("CafeList", cafeService.selectAddedCafes());

		model.addAttribute("cafeListTitle", "승인된 카페");
		model.addAttribute("content", "cafe/cafeList");
		return "main";
	}

	// 접속한 유저의 아이디로 즐겨찾기한 카페 리스트 반환.
	@RequestMapping(value = "/myPavoriteCafe", method = RequestMethod.GET)
	public String myPavoriteCafe(Model model, @SessionAttribute MemberVO signedMember) {

		String user_id = signedMember.getId();

		model.addAttribute("CafeList", cafeService.myFavoriteCafes(user_id));
		model.addAttribute("content", "cafe/cafeList");

		return "main";

	}

	// 즐겨찾기 버튼을 눌러 즐겨찾기 테이블로.
	@RequestMapping(value = "/intoFavoriteAction", method = RequestMethod.GET)
	public String intoFavoriteAction(Model model, @SessionAttribute MemberVO signedMember,
			@RequestParam("cafe_id") String cafe_id) {

		String user_id = signedMember.getId();
		int added = cafeService.toFavorite(user_id, cafe_id);
		if (added != 1) {

			// 즐겨찾기에 등록이 실패하였습니다.
		}

		// 알러트로 실패하면 알릴 필요는 있음.
		// 페이지 이동은 하지 않음.
		return null;
	}

	// 다시 즐겨찾기 버튼을 눌러서 즐겨찾기 테이블에서 삭제.
	@RequestMapping(value = "/deleteFavoriteAction", method = RequestMethod.GET)
	public String deleteFavoriteAction(Model model, @SessionAttribute MemberVO signedMember,
			@RequestParam("cafe_id") String cafe_id) {

		String user_id = signedMember.getId();
		int added = cafeService.deleteFavorite(user_id, cafe_id);
		if (added != 1) {

			// 즐겨찾기 취소가 실패하였습니다.
		}

		// 알러트로 실패하면 알릴 필요는 있음.
		// 페이지 이동은 하지 않음.
		return null;
	}

	// 카페를 클릭하여 해당 카페의 아이디로 정보 겟.
	@RequestMapping(value = "/cafe/getSpecificCafe", method = RequestMethod.GET)
	public String getSpecificCafe(Model model, @RequestParam("cafe_id") String cafe_id) {

		if (cafeService.searchSpecificWaitingCafe(cafe_id) != null) { // 대기중인 카페에서 뽑음.
			model.addAttribute("thisCafe", cafeService.searchSpecificWaitingCafe(cafe_id));
			model.addAttribute("approveCafe", "카페 승인버튼 활성화");

		} else { // 등록된 카페에서 뽑음.
			model.addAttribute("thisCafe", cafeService.selectAddedCafeByCafeId(cafe_id));
			model.addAttribute("newReviewVO", new ReviewVO());
		}
		model.addAttribute("content", "cafe/specificCafe");
		return "main";
	}

	// 즐겨찾기 추가하기 버튼.
	@RequestMapping(value = "/cafe/toggleFavorite", method = RequestMethod.GET)
	public String toggleFavorite(Model model, @RequestParam("cafe_id") String cafe_id, @SessionAttribute MemberVO signedMember) {
		
		// 즐겨찾기 주차됨.
		if(cafeService.toFavorite(signedMember.getId(), cafe_id) == 1) {
			model.addAttribute("msg","즐겨찾기에 추가되었습니다.");
			
		} else if(cafeService.toFavorite(signedMember.getId(), cafe_id) == 0) {
			cafeService.deleteFavorite(signedMember.getId(), cafe_id);
			model.addAttribute("msg","즐겨찾기에서 제외되었습니다.");
		}
		// 리스폰즈 바디 사용해서 history.go(1)?
		return null;
	}
	
	// 이름이나 지역으로 검색하기.
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, @RequestParam("search") String search) {
		System.out.println(search);
		model.addAttribute("CafeList", cafeService.searchByCafe(search));
		System.out.println(cafeService.searchByCafe(search).toString());
		model.addAttribute("content", "cafe/cafeList");
		model.addAttribute("cafeListTitle", "검색 카페");
		return "main";
	}
	
}