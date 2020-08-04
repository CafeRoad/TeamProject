package com.sql.cafe.mapper;

import org.springframework.stereotype.Repository;
import java.util.ArrayList;

import com.sql.cafe.vo.NoticeVO;

@Repository
public interface  NoticeMapper {

//	void insertNotice(NoticeVO noticeVO);

	ArrayList<NoticeVO> selectByNoticeID(String notice_id);
	
	int deleteFromNotice(String admin_id, String password);
	
	
	
}
