package com.sql.cafe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.sql.cafe.mapper.NoticeMapper;
import com.sql.cafe.vo.NoticeVO;
import com.sql.cafe.vo.ReviewVO;

public class NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;

	public void insertNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeMapper.insertNotice(noticeVO);
	}
	
	public ArrayList<NoticeVO> selectByNoticeId(String notice_id) {
		return noticeMapper.selectByNoticeID(notice_id);

	}
	
	public int deletenotice(String admin_id, String password) {
		return noticeMapper.deleteFromNotice(admin_id, password);
		
	}

}
