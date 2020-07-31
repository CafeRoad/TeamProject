package com.sql.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.sql.cafe.mapper.NoticeMapper;
import com.sql.cafe.vo.NoticeVO;

public class NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;

	public void insertNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeMapper.insertNotice(noticeVO);
	}

}
