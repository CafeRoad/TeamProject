package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.NoticeVO;

@Repository
public interface  NoticeMapper {

//	void insertNotice(NoticeVO noticeVO);
	final String INSERT_INTO_NOTICE = "insert into noitce (notice_id, notice_name, password, create_time, admin_id, content) values(#{notice_id}, #{notice_name}, #{password}, now(), #{admin_id})";
	
	@Insert(INSERT_INTO_NOTICE)
		int insertIntoNotice(NoticeVO noticeVO);
	
	
}
