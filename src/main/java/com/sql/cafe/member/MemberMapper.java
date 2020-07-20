package com.sql.cafe.member;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {

	final String SELECT_BY_ID = "select * from member where id = #{id}";
	
	@Select(SELECT_BY_ID)
	@Results(value = { @Result(property = "id", column = "id"), @Result(property = "password", column = "password"),
			@Result(property = "email", column = "email"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "tel", column = "tel"), @Result(property = "authority", column = "authority") })
	MemberDTO getSpecificRow(@Param("id") String id);
	
	
}
