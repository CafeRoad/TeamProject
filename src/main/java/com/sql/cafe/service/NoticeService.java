package com.sql.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sql.cafe.mapper.NoticeMapper;
import com.sql.cafe.vo.NoticeVO;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;

//	public void insertNotice(NoticeVO noticeVO) {
//		// TODO Auto-generated method stub
//		noticeMapper.insertNotice(noticeVO);
//	}

}
