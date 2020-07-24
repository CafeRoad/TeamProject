package com.sql.cafe.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.CafeVO;

@Repository
public interface CafeMapper {

	// 대기중인 카페 등록.
	final String INSERT_TO_WAITING_CAFE = "insert into waiting_cafe (owner_id, cafe_name, gu, address, event, homepage, intro, create_time) "
			+ "values (#{owner_id}, #{cafe_name}, #{gu}, #{address}, #{event}, #{homepage}, #{intro}, now())";

	@Insert(INSERT_TO_WAITING_CAFE)
	void insertToWaitingCafe(CafeVO cafeVO);

	// 대기중인 카페 옵션 인서트.
	final String INSERT_TO_WAITING_CAFE_OPTION = "insert into waiting_cafe_option (cafe_id, concent, pet, seat, wifi, parking_zone, smoking_room, toilet) "
			+ "values (#{cafe_id}, #{concent}, #{pet}, #{seat}, #{wifi}, #{parking_zone}, #{smoking_room}, #{toilet})";

	@Insert(INSERT_TO_WAITING_CAFE_OPTION)
	void insertToWaitingCafeOption(CafeVO cafeVO);

	// 대기중인 카페 옵션에 넣기 위해 대기중인 카페의 id를 겟.
	final String GET_NOW_CAFE_ID = "select max(cafe_id) as cafe_id from waiting_cafe";
	@Select(GET_NOW_CAFE_ID)
	@Result(property = "cafe_id", column = "cafe_id")
	String getNowCafeId();
	
	// 오너 아이디로 오너의 등록 대기중인 카페 정보 검색.
	final String SELECT_WAITING_CAFES_BY_OWNER_ID = "select * from waiting_cafe natural join waiting_cafe_option where owner_id = #{owner_id}";

	@Select(SELECT_WAITING_CAFES_BY_OWNER_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet") })
	ArrayList<CafeVO> selectWaitingCafesByOwnerId(@Param("owner_id") String owner_id);

	// 오너 아이디로 오너의 등록된 카페 정보 검색.
	final String SELECT_ADDED_CAFES_BY_OWNER_ID = "select * from added_cafe natural join added_cafe_option where owner_id = #{owner_id}";

	@Select(SELECT_ADDED_CAFES_BY_OWNER_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet") })
	ArrayList<CafeVO> selectAddedCafesByOwnerId(@Param("owner_id") String owner_id);

	// 승인을 위해 승인 대기중인 모든 카페 리스트 검색.
	final String SELECT_ALL_FROM_WAITING_CAFE = "select * from waiting_cafe natural join waiting_cafe_option";
	
	@Select(SELECT_ALL_FROM_WAITING_CAFE)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet") })
	ArrayList<CafeVO> selectAllFromWaitingCafe();
	
	// 승인을 위해 승인 대기중인 모든 카페 리스트 검색.
	final String SELECT_ALL_FROM_ADDED_CAFE = "select * from added_cafe natural join added_cafe_option";
	
	@Select(SELECT_ALL_FROM_ADDED_CAFE)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet") })
	ArrayList<CafeVO> selectAllFromAddedCafe();
	
	// 승인을 위해 카페를 선택하여 해당 카페아이디로 카페 정보 검색.
	final String SELECT_WAITING_CAFES_BY_CAFE_ID = "select * from waiting_cafe natural join waiting_cafe_option where cafe_id = #{cafe_id}";

	@Select(SELECT_WAITING_CAFES_BY_CAFE_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet") })
	CafeVO selectWaitingCafeByCafeId(@Param("cafe_id") String cafe_id);
	
	// 특정 카페 선택시 카페 아이디로 등록된 특정 카페 정보 검색.
	final String SELECT_ADDED_CAFES_BY_CAFE_ID = "select * from added_cafe natural join added_cafe_option where cafe_id = #{cafe_id}";

	@Select(SELECT_ADDED_CAFES_BY_CAFE_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet") })
	CafeVO selectAddedCafeByCafeId(@Param("cafe_id") String cafe_id);

	// 선택한 카페를 즐겨찾기에 등록.
	final String TO_FAVORITE = "insert into favorite (user_id, cafe_id)values (#{user_id}, #{cafe_id})";

	@Insert(TO_FAVORITE)
	int toFavorite(@Param("user_id") String user_id, @Param("cafe_id") String cafe_id);
	
	// 선택한 카페를 즐겨찾기에서 취소.
	final String DELETE_FAVORITE = "delete from favorite where user_id = #{user_id} and cafe_id = #{cafe_id";
	
	@Delete(DELETE_FAVORITE)
	int deleteFavorite(@Param("user_id") String user_id, @Param("cafe_id") String cafe_id);

	// 즐겨찾기한 카페들의 정보를 검색.
	final String MY_FAVORITE_CAFES = "seletct * from added_cafe natural join added_cafe_option where cafe_id in (select cafe_id from favorite where user_id = #{user_id})";

	@Select(MY_FAVORITE_CAFES)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "seat", column = "seat"), @Result(property = "wifi", column = "wifi"),
			@Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet") })
	ArrayList<CafeVO> myFavoriteCafes(@Param("user_id") String user_id);

	// 이 카페를 즐겨찾기 한 유저의 수.
	final String HOW_MANY_FAVORITE_THIS_CAFE = "select count(user_id) as count from favorite where cafe_id = #{cafe_id}";

	@Select(HOW_MANY_FAVORITE_THIS_CAFE)
	@Result(property = "count", column = "count")
	int howManyFavoriteThisCafe(@Param("cafe_id") String cafe_id);

	
	// 승인된 카페 등록.
	final String INSERT_TO_ADDED_CAFE = "insert into added_cafe (cafe_id, owner_id, cafe_name, gu, address, event, homepage, intro, create_time) "
			+ "values (#{cafe_id}, #{owner_id}, #{cafe_name}, #{gu}, #{address}, #{event}, #{homepage}, #{intro}, now())";

	@Insert(INSERT_TO_ADDED_CAFE)
	void insertToAddedCafe(CafeVO cafeVO);

	// 승인된 카페 옵션 인서트.
	final String INSERT_TO_ADDED_CAFE_OPTION = "insert into added_cafe_option (cafe_id, concent, pet, seat, wifi, parking_zone, smoking_room, toilet) "
			+ "values (#{cafe_id}, #{concent}, #{pet}, #{seat}, #{wifi}, #{parking_zone}, #{smoking_room}, #{toilet})";

	@Insert(INSERT_TO_ADDED_CAFE_OPTION)
	void insertToAddedCafeOption(CafeVO cafeVO);
	
	// 승인 후 대기중인 카페에서 제거. on delete cascade라서 카페를 지우면 카페 옵션도 이어져서 삭제.
	final String DELETE_FROM_WAITING_CAFE = "delete from waiting_cafe where cafe_id = #{cafe_id}";
	
	@Delete(DELETE_FROM_WAITING_CAFE)
	int deleteFromWaitingCafe(@Param("cafe_id") String cafe_id);
	
	// 승인된 카페에서 제거. on delete cascade라서 카페를 지우면 카페 옵션도 이어져서 삭제.
	final String DELETE_FROM_ADDED_CAFE = "delete from added_cafe where cafe_id = #{cafe_id}";
	
	@Delete(DELETE_FROM_ADDED_CAFE)
	int deleteFromAddedCafe(@Param("cafe_id") String cafe_id);
	
	final String SELECT_FROM_ADDED_CAFE_BY_CAFE_ID = "select * from added_cafe natural join added_cafe_option where cafe_id = #{cafe_id}";
}
