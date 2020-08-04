package com.sql.cafe.mapper;

import java.util.ArrayList;

import com.sql.cafe.vo.NoticeVO;

public interface  NoticeMapper {

	void insertNotice(NoticeVO noticeVO);

	ArrayList<NoticeVO> selectByNoticeID(String notice_id);
	
	int deleteFromNotice(String admin_id, String password);
	
	
	
}
