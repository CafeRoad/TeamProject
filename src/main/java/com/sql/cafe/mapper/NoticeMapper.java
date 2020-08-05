package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;

import com.sql.cafe.vo.NoticeVO;

@Repository
public interface NoticeMapper {

	final String INSERT_TO_NOTICE = "insert into notice (notice_name,password,create_time,admin_id,content) values (#{notice_name}, #{password}, now(), #{admin_id}, #{content})";

	@Insert(INSERT_TO_NOTICE)
	int insertToNotice(NoticeVO noticeVO);

	final String SELECT_BY_NOTICE = "select * from notice order by notice_id desc";

	@Select(SELECT_BY_NOTICE)
	@Results(value = { @Result(property = "notice_id", column = "notice_id"),
			@Result(property = "notice_name", column = "notice_name"),
			@Result(property = "user_id", column = "user_id"), @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "password", column = "password"),
			@Result(property = "create_time", column = "create_time"),
			@Result(property = "admin_id", column = "admin_id"), @Result(property = "content", column = "content") })
	ArrayList<NoticeVO> selecttnoticelist();

	final String SELECT_BY_NOTICEREAD = "select * from notice where notice_id = #{notice_id}";

	@Select(SELECT_BY_NOTICEREAD)
	@Results(value = { @Result(property = "notice_id", column = "notice_id"),
			@Result(property = "notice_name", column = "notice_name"),
			@Result(property = "user_id", column = "user_id"), @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "password", column = "password"),
			@Result(property = "create_time", column = "create_time"),
			@Result(property = "admin_id", column = "admin_id"), @Result(property = "content", column = "content") })
	NoticeVO selecttnoticeread(@Param("notice_id") String notice_id);

	final String DELETE = "delete from notice where notice_id = #{notice_id}";

	@Delete(DELETE)
	int delete(@Param("notice_id") String notice_id);

}
