package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;

import com.sql.cafe.vo.NoticeVO;

@Repository
public interface  NoticeMapper {

	final String INSERT_TO_NOTICE = "insert into notice (notice_name,password,create_time,admin_id,content) values (#{notice_name}, #{password}, now(), #{admin_id}, #{content})";

	@Insert(INSERT_TO_NOTICE)
	int insertToNotice(NoticeVO noticeVO);
	
	
}
