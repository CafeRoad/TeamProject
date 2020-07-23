package com.sql.cafe.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.CafeVO;

@Repository
public interface CafeMapper {


	//카페 등록.
	final String INSERT_NEW_WAITING_CAFE = "insert into waiting_cafe (owner_id, cafe_name, gu, address, sns, event, homepage, intro, create_time) values (#{owner_id}, #{cafe_name}, #{gu}, #{address}, #{sns}, #{event}, #{homepage}, #{intro}, now())";
	@Insert(INSERT_NEW_WAITING_CAFE)
	void insertNewCafeToCafe(CafeVO cafeVO);
	
	// 카페 옵션 인서트.
	final String INSERT_NEW_WAITING_CAFE_OPTION = "insert into  waiting_cafe_option (cafe_id, concent, pet, seat, wifi, local_money, parking_zone, sdutyroom, toilet) values (#{cafe_id}, #{concent}, #{pet}, #{seat}, #{wifi}, #{local_money}, #{parking_zone}, #{sdutyroom}, #{toilet})";

	@Insert(INSERT_NEW_WAITING_CAFE_OPTION)
	void insertNewCafeToCafeOption(CafeVO cafeVO);

	// 오너 아이디로  오너의 등록 대기중인 카페 정보 검색.
	final String SELECT_WAITING_CAFES_BY_OWNER_ID = "select * from waiting_cafe natural join waiting_cafe_option where owner_id = #{owner_id}";
	
	@Select(SELECT_WAITING_CAFES_BY_OWNER_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"), @Result(property = "owner_id", column = "owner_id"),
			@Result(property = "cafe_name", column = "cafe_name"), @Result(property = "gu", column = "gu"),
			@Result(property = "address", column = "address"), @Result(property = "sns", column = "sns"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "local_money", column = "local_money"), @Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "sdutyroom", column = "sdutyroom"), @Result(property = "toilet", column = "toilet") })
	ArrayList<CafeVO> selectWaitingCafesByOwnerId(@Param("owner_id") String owner_id);
	
	// 오너 아이디로  오너의 등록된 카페 정보 검색.
	final String SELECT_ADDED_CAFES_BY_OWNER_ID = "select * from added_cafe natural join added_cafe_option where owner_id = #{owner_id}";
	
	@Select(SELECT_ADDED_CAFES_BY_OWNER_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"), @Result(property = "owner_id", column = "owner_id"),
			@Result(property = "cafe_name", column = "cafe_name"), @Result(property = "gu", column = "gu"),
			@Result(property = "address", column = "address"), @Result(property = "sns", column = "sns"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "local_money", column = "local_money"), @Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "sdutyroom", column = "sdutyroom"), @Result(property = "toilet", column = "toilet") })
	ArrayList<CafeVO> selectAddedCafesByOwnerId(@Param("owner_id") String owner_id);
	
	// 카페 아이디로  등록된 특정 카페 정보 검색.
		final String SELECT_ADDED_CAFES_BY_CAFE_ID = "select * from added_cafe natural join added_cafe_option where cafe_id = #{cafe_id}";
		
		@Select(SELECT_ADDED_CAFES_BY_CAFE_ID)
		@Results(value = { @Result(property = "cafe_id", column = "cafe_id"), @Result(property = "owner_id", column = "owner_id"),
				@Result(property = "cafe_name", column = "cafe_name"), @Result(property = "gu", column = "gu"),
				@Result(property = "address", column = "address"), @Result(property = "sns", column = "sns"),
				@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
				@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
				@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
				@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
				@Result(property = "local_money", column = "local_money"), @Result(property = "parking_zone", column = "parking_zone"),
				@Result(property = "sdutyroom", column = "sdutyroom"), @Result(property = "toilet", column = "toilet") })
		ArrayList<CafeVO> selectAddedCafesByCafeId(@Param("cafe_id") String cafe_id);
		
	
	
//	카페 테이블 리절트.
//	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"), @Result(property = "owner_id", column = "owner_id"),
//			@Result(property = "cafe_name", column = "cafe_name"), @Result(property = "gu", column = "gu"),
//			@Result(property = "address", column = "address"), @Result(property = "sns", column = "sns"),
//			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
//			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time") })
	
//	카페 온셥 테이블 리절트.
//	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
//			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
//			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
//			@Result(property = "local_money", column = "local_money"), @Result(property = "parking_zone", column = "parking_zone"),
//			@Result(property = "sdutyroom", column = "sdutyroom"), @Result(property = "toilet", column = "toilet") })
	
	
	
}
