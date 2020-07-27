package com.sql.cafe.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	HttpServletRequest request;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	// 현재 view를 확인하기 위한 기능들이 들어가 있음. 수정되면 다른 컨트롤러로 옮겨야 함.
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		logger.info("Welcome test! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "test1";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		logger.info("Welcome index! ");
		model.addAttribute("banner_full", "True");
		return "index";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String include(Model model) {
		logger.info("Welcome include!");

		model.addAttribute("banner_full", "True");
		return "main";
	}

	// 파일 업로드 테스트를 위해 만듦.
	@RequestMapping(value = "/filetest", method = RequestMethod.GET)
	public String filetest(Model model) {
		logger.info("Welcome filetest!");

		return "filetest";
	}

	// 파일 업로드 테스트
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String upload(MultipartFile uploadfile, Model model, HttpServletRequest request, String dir) {
		logger.info("upload() POST 호출");
		logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
		logger.info("파일 크기: {}", uploadfile.getSize());

		System.out.println("경로 테스트 : " + request.getSession().getServletContext().getRealPath("\\resources\\assets\\imgtest"));
System.out.println("다은 dir"+dir);
		String filename = saveFile(uploadfile, dir);
		
		System.out.println("자바 절대 경로"+this.getClass().getResource("").getPath());
		
//		File file = new File(arg0, arg1)
		System.err.println(filename);
		if (filename != null) { // 파일 저장 성공
			model.addAttribute("filename", filename);
			model.addAttribute("result", "success");
		} else { // 파일 저장 실패
			model.addAttribute("result", "fail");
		}

		return "filetest";
	}


	private String saveFile(MultipartFile file, String dir) {
		// 파일 이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();

		logger.info("saveName: {}", saveName);

		// 저장할 File 객체를 생성(껍데기 파일)
		File saveFile = new File(dir, saveName); // 저장할 폴더 이름, 저장할 파일 이름

		try {
			file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		return saveName;
	}

}
