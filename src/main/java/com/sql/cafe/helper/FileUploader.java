package com.sql.cafe.helper;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	private static final Logger logger = LoggerFactory.getLogger(FileUploader.class);

	public static String saveFileAtNewFolder(MultipartFile file, String newFolder) {
		// 파일 이름 변경
		String saveName = file.getOriginalFilename();

		// 저장할 File 객체를 생성(껍데기 파일)
		File saveFile = new File(newFolder, saveName); // 저장할 폴더 이름, 저장할 파일 이름
		File createFolder = new File(newFolder);
		createFolder.mkdir();
		try {
			file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		return saveName;
	}

	public static String saveFile(MultipartFile file, String newFolder) {
		// 파일 이름 변경
		String saveName = file.getOriginalFilename();


		// 저장할 File 객체를 생성(껍데기 파일)
		File saveFile = new File(newFolder, saveName); // 저장할 폴더 이름, 저장할 파일 이름
		try {
			file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		return saveName;
	}
}
