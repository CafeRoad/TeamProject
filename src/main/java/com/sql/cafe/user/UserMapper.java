package com.sql.cafe.user;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

	final String SELECT_BY_ID = "select * from user where user_id = #{user_id}";
	
	@Select(SELECT_BY_ID)
	@Results(value = { @Result(property = "user_id", column = "user_id"), @Result(property = "password", column = "password"),
			@Result(property = "email", column = "email"), @Result(property = "gender", column = "gender"),
			@Result(property = "nickname", column = "nickname"), @Result(property = "local", column = "local"),
			@Result(property = "birth", column = "birth"), @Result(property = "interesting", column = "interesting"),
			@Result(property = "create_time", column = "create_time") })
	UserDTO getSpecificRow(@Param("user_id") String user_id);
	
	
}
