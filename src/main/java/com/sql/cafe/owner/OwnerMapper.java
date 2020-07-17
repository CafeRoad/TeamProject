package com.sql.cafe.owner;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Repository
public interface OwnerMapper {

final String SELECT_BY_ID = "select * from owner where owner_id = #{owner_id}";
	
	@Select(SELECT_BY_ID)
	@Results(value = { @Result(property = "owner_id", column = "owner_id"), @Result(property = "password", column = "password"),
			@Result(property = "email", column = "email"), @Result(property = "tel", column = "tel"),
			@Result(property = "create_time", column = "create_time") })
	OwnerDTO getSpecificRow(@Param("owner_id") String owner_id);
	
}
