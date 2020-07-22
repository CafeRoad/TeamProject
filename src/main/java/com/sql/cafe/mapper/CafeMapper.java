package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.CafeVO;
import com.sql.cafe.vo.Cafe_optionVO;

@Repository
public interface CafeMapper {

	//카페 등록.
	final String INSERT_NEW_WAITING_CAFE = "insert into waiting_cafe (cafe_id, owner_id, cafe_name, gu, address, sns, event, homepage, intro, create_time) values (#{cafe_id}, #{owner_id}, #{cafe_name}, #{gu}, #{address}, #{sns}, #{event}, #{homepage}, #{intro}, now())";
	@Insert(INSERT_NEW_WAITING_CAFE)
	void insertNewCafeToCafe(CafeVO cafeVO);
	
	final String INSERT_NEW_WAITING_CAFE_OPTION = "insert into  waiting_cafe_option (cafe_id, concent, pet, seat, wifi, local_money, parking_zone, sdutyroom, toilet) values (#{cafe_id}, #{concent}, #{pet}, #{seat}, #{wifi}, #{local_money}, #{parking_zone}, #{sdutyroom}, #{toilet})";
	@Insert(INSERT_NEW_WAITING_CAFE_OPTION)
	void insertNewCafeToCafeOption(Cafe_optionVO cafe_optionVO);
	
	
}

