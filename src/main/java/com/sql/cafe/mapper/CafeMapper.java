package com.sql.cafe.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.CafeVO;

@Repository
public interface CafeMapper {

	// 대기중인 카페 등록.
	final String INSERT_TO_WAITING_CAFE = "insert into cafe (owner_id, cafe_name, gu, address, event, homepage, intro, create_time, concent, pet, wifi, parking_zone, smoking_room, toilet, img_main, img01, img02, img03, img04, img05, img06, operating_time, cafe_tel, lat, lng, approval )values (#{owner_id}, #{cafe_name}, #{gu}, #{address}, #{event}, #{homepage}, #{intro}, now(), #{concent},"
			+ " #{pet}, #{wifi}, #{parking_zone}, #{smoking_room}, #{toilet}, #{img_main}, #{img01}, #{img02}, #{img03}, #{img04}, #{img05}, #{img06}, #{operating_time}, #{cafe_tel},"
			+ " #{lat}, #{lng}, 0)";

	@Insert(INSERT_TO_WAITING_CAFE)
	int insertToWaitingCafe(CafeVO cafeVO);

	// 승인된 카페 테이블에 넣기 위해 대기중인 카페의 id를 겟.
	final String GET_NOW_CAFE_ID = "select max(cafe_id) as cafe_id from cafe";

	@Select(GET_NOW_CAFE_ID)
	String getNowCafeId();

	// 오너 아이디로 오너의 등록 대기중인 카페 정보 검색.
	final String SELECT_WAITING_CAFES_BY_OWNER_ID = "select * from (select * from cafe where owner_id = #{owner_id} and approval = 0) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id limit #{selectPage}, 10";

	@Select(SELECT_WAITING_CAFES_BY_OWNER_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	ArrayList<CafeVO> selectWaitingCafesByOwnerId(@Param("owner_id") String owner_id,
			@Param("selectPage") int selectPage);

	// 페이징을 위해 오너의 대기중인 카페 갯수를 검색
	final String COUNT_WAITING_CAFE_BY_OWNER_ID = "select count(*) from cafe where owner_id = #{owner_id} and approval = 0";

	@Select(COUNT_WAITING_CAFE_BY_OWNER_ID)
	int countWaitingCafeByOwnerId();

	// 오너 아이디로 오너의 등록된 카페 정보 검색.
	final String SELECT_ADDED_CAFES_BY_OWNER_ID = "select * from (select * from cafe where owner_id = #{owner_id} and approval = 1) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id limit #{selectPage}, 10";

	@Select(SELECT_ADDED_CAFES_BY_OWNER_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	ArrayList<CafeVO> selectAddedCafesByOwnerId(@Param("owner_id") String owner_id,
			@Param("selectPage") int selectPage);

	// 페이징을 위해 오너의 등록된 카페 갯수를 검색
	final String COUNT_ADDED_CAFE_BY_OWNER_ID = "select count(*) from cafe where owner_id = #{owner_id} and approval = 1";

	@Select(COUNT_ADDED_CAFE_BY_OWNER_ID)
	int countAddedCafeByOwnerId();

	// 승인을 위해 승인 대기중인 모든 카페 리스트 검색.
	final String SELECT_ALL_FROM_WAITING_CAFE = "select * from (select * from cafe where approval = 0) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id limit #{selectPage}, 10";

	@Select(SELECT_ALL_FROM_WAITING_CAFE)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	ArrayList<CafeVO> selectAllFromWaitingCafe(@Param("selectPage") int selectPage);

	// 페이징을 위해 모든 대기중인 카페 갯수를 검색
	final String COUNT_WAITING_CAFE = "select count(*) from cafe where approval = 0";

	@Select(COUNT_WAITING_CAFE)
	int countWaitingCafe();

	// 검색을 위해 승인된 모든 카페 리스트 검색.
	final String SELECT_ALL_FROM_ADDED_CAFE = "select * from (select * from cafe where approval = 1) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id limit #{selectPage}, 10";

	@Select(SELECT_ALL_FROM_ADDED_CAFE)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	ArrayList<CafeVO> selectAllFromAddedCafe(@Param("selectPage") int selectPage);

	// 페이징을 위해 모든 승인된 카페 갯수를 검색
	final String COUNT_ADDED_CAFE = "select count(*) from cafe where approval = 1";

	@Select(COUNT_ADDED_CAFE)
	int countAddedCafe();

	// 승인을 위해 카페를 선택하여 해당 카페아이디로 카페 정보 검색.
	final String SELECT_WAITING_CAFES_BY_CAFE_ID = "select * from (select * from cafe where cafe_id = #{cafe_id} and approval = 0) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id";

	@Select(SELECT_WAITING_CAFES_BY_CAFE_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	CafeVO selectWaitingCafeByCafeId(@Param("cafe_id") String cafe_id);

	// 특정 카페 선택시 카페 아이디로 등록된 특정 카페 정보 검색.
	final String SELECT_ADDED_CAFES_BY_CAFE_ID = "select * from (select * from cafe where cafe_id = #{cafe_id} and approval = 1) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id";

	@Select(SELECT_ADDED_CAFES_BY_CAFE_ID)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	CafeVO selectAddedCafeByCafeId(@Param("cafe_id") String cafe_id);

	// 선택한 카페를 즐겨찾기에 등록.
	final String TO_FAVORITE = "insert into favorite (user_id, cafe_id) values (#{user_id}, #{cafe_id})";

	@Insert(TO_FAVORITE)
	int toFavorite(@Param("user_id") String user_id, @Param("cafe_id") String cafe_id);

	// 선택한 카페를 즐겨찾기에서 취소.
	final String DELETE_FAVORITE = "delete from favorite where user_id = #{user_id} and cafe_id = #{cafe_id";

	@Delete(DELETE_FAVORITE)
	int deleteFavorite(@Param("user_id") String user_id, @Param("cafe_id") String cafe_id);

	// 즐겨찾기한 카페들의 정보를 검색.
	final String MY_FAVORITE_CAFES = "select * from (seletct * from cafe where cafe_id in (select cafe_id from favorite where user_id = #{user_id})) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id limit #{selectPage}, 10";

	@Select(MY_FAVORITE_CAFES)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	ArrayList<CafeVO> myFavoriteCafes(@Param("user_id") String user_id, @Param("selectPage") int selectPage);

	// 페이징을 위해 내가 즐겨잧기한 카페 갯수를 검색
	final String COUNT_FAVORITE_CAFE = "seletct * from cafe where cafe_id in (select cafe_id from favorite where user_id = #{user_id})";

	@Select(COUNT_FAVORITE_CAFE)
	int countFavoriteCafe();
	
	
	// 이 카페를 즐겨찾기 한 유저의 수.
	final String HOW_MANY_FAVORITE_THIS_CAFE = "select count(user_id) as count from favorite where cafe_id = #{cafe_id}";

	@Select(HOW_MANY_FAVORITE_THIS_CAFE)
	int howManyFavoriteThisCafe(@Param("cafe_id") String cafe_id);

	// 승인된 카페 등록.
	final String INSERT_TO_ADDED_CAFE = "update cafe set approval = 1 where cafe_id = #{cafe_id}";

	@Update(INSERT_TO_ADDED_CAFE)
	void insertToAddedCafe(CafeVO cafeVO);

	// 승인된 카페에서 제거. on delete cascade라서 카페를 지우면 카페 옵션도 이어져서 삭제.
	final String DELETE_FROM_CAFE = "delete from cafe where cafe_id = #{cafe_id}";

	@Delete(DELETE_FROM_CAFE)
	int deleteFromAddedCafe(@Param("cafe_id") String cafe_id);

	// 지역이나 이름으로 카페 검색.
	final String SEARCH_BY_CAFE_NAME = "select * from (select * from cafe where approval = 1 and cafe_name like concat('%',#{search},'%') or gu like concat('%',#{search},'%') or address like concat('%',#{search},'%')) a left outer join (select cafe_id, avg(stars) as avg_star from review) b on a.cafe_id = b.cafe_id limit #{selectPage}, 10";

	@Select(SEARCH_BY_CAFE_NAME)
	@Results(value = { @Result(property = "cafe_id", column = "cafe_id"),
			@Result(property = "owner_id", column = "owner_id"), @Result(property = "cafe_name", column = "cafe_name"),
			@Result(property = "gu", column = "gu"), @Result(property = "address", column = "address"),
			@Result(property = "event", column = "event"), @Result(property = "homepage", column = "homepage"),
			@Result(property = "intro", column = "intro"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "concent", column = "concent"), @Result(property = "pet", column = "pet"),
			@Result(property = "wifi", column = "wifi"), @Result(property = "smoking_room", column = "smoking_room"),
			@Result(property = "parking_zone", column = "parking_zone"),
			@Result(property = "toilet", column = "toilet"), @Result(property = "img_main", column = "img_main"),
			@Result(property = "img01", column = "img01"), @Result(property = "img02", column = "img02"),
			@Result(property = "img03", column = "img03"), @Result(property = "img04", column = "img04"),
			@Result(property = "img05", column = "img05"), @Result(property = "img06", column = "img06"),
			@Result(property = "lat", column = "lat"), @Result(property = "lin", column = "lin"),
			@Result(property = "operating_time", column = "operating_time"),
			@Result(property = "avg_star", column = "avg_star"), @Result(property = "approval", column = "approval"),
			@Result(property = "cafe_tel", column = "cafe_tel") })
	ArrayList<CafeVO> searchByCafe(@Param("search") String search, @Param("selectPage") int selectPage);

	// 새로 들어가는 카페의 사진을 넣을 폴더id를 얻기 위해.
	final String SELECT_MAX_CAFE_ID = "select max(cafe_id) from cafe";

	@Select(SELECT_MAX_CAFE_ID)
	int selectMaxCafeId();

	final String SELECT_COUNT_SEARCH_BY_CAFE_NAME = "select count(*) from cafe where approval = 1 and cafe_name like concat('%',#{search},'%') or gu like concat('%',#{search},'%') or address like concat('%',#{search},'%')";

	@Select(SELECT_COUNT_SEARCH_BY_CAFE_NAME)
	int selectCountSearch(@Param("search") String search);
	
	//아티클로 검색하여 카페 정보를 겟.
	final String GET_ARTICLE_CAFES = "";
}
