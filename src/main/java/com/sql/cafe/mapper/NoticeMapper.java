package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;

import com.sql.cafe.vo.NoticeVO;

@Repository
public interface  NoticeMapper {

//	void insertNotice(NoticeVO noticeVO);

	ArrayList<NoticeVO> selectByNoticeID(String notice_id);
	
	int deleteFromNotice(String admin_id, String password);
	
	
	
	
	
	
	
	
	
	
	
	final String DELETE = "delete from notice where notice_id = #{notice_id}";
	
	@Delete(DELETE)
	int delete(@Param("notice_id") String notice_id);

	
	
	
	
	
	
	
	
}
