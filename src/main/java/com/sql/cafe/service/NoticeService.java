package com.sql.cafe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sql.cafe.mapper.NoticeMapper;
import com.sql.cafe.vo.NoticeVO;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	public void insertNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeMapper.insertToNotice(noticeVO);
	}

	public ArrayList<NoticeVO> selectByNotice() {
		return noticeMapper.selecttnoticelist();

	}

	public int delete(String notice_id) {
		return noticeMapper.delete(notice_id);

	}

	public NoticeVO readNotice(String notice_id) {
		return noticeMapper.selecttnoticeread(notice_id);

	}

}
