package com.sql.cafe.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.ReviewVO;


@Repository
public interface ReviewMapper {
	
	//리뷰 쓰면 넣기.
	final String INSERT_INTO_REVIEW = "insert into review (review_name, user_id, cafe_id, password, create_time, content, stars, star_taste, star_mood, star_service, star_clean) values(#{review_name}, #{user_id}, #{cafe_id}, #{password}, now(), #{content}, (#{star_taste} + #{star_mood} + #{star_service} + #{star_clean}) / 4, #{star_taste}, #{star_mood}, #{star_service}, #{star_clean})";
	
	@Insert(INSERT_INTO_REVIEW)
	int insertIntoReview(ReviewVO reviewVO);
	
	// 유저의 아이디로 내가 쓴 리뷰 모아보기.
	final String SELECT_BY_USER_ID = "select * from (select * from review where user_id = #{user_id}) a, (select cafe_id, cafe_name from cafe) b where a.cafe_id = b.cafe_id order by create_time;";
	@Select(SELECT_BY_USER_ID)
	@Results(value = { @Result(property = "review_id", column = "review_id"),
			@Result(property = "review_name", column = "review_name"), @Result(property = "user_id", column = "user_id"),
			@Result(property = "cafe_id", column = "cafe_id"), @Result(property = "password", column = "password"),
			@Result(property = "create_time", column = "create_time"), @Result(property = "content", column = "content"),
			@Result(property = "stars", column = "stars"), @Result(property = "star_taste", column = "star_taste"),
			@Result(property = "star_mood", column = "star_mood"), @Result(property = "star_service", column = "star_service"),
			@Result(property = "star_clean", column = "star_clean"), @Result(property = "cafe_name", column = "cafe_name") })
	ArrayList<ReviewVO> selectByUserID(@Param("user_id") String user_id);
	
	// 특정 카페 보면서 같이 뽑힐 카페 아이디로 카페에 쓰여진 리뷰 보기.
	final String SELECT_BY_CAFE_ID = "select * from (select * from review where cafe_id = #{cafe_id}) a, (select cafe_id, cafe_name from cafe) b where a.cafe_id = b.cafe_id order by create_time";
	@Select(SELECT_BY_CAFE_ID)
	@Results(value = { @Result(property = "review_id", column = "review_id"),
			@Result(property = "review_name", column = "review_name"), @Result(property = "user_id", column = "user_id"),
			@Result(property = "cafe_id", column = "cafe_id"), @Result(property = "password", column = "password"),
			@Result(property = "create_time", column = "create_time"), @Result(property = "content", column = "content"),
			@Result(property = "stars", column = "stars"), @Result(property = "star_taste", column = "star_taste"),
			@Result(property = "star_mood", column = "star_mood"), @Result(property = "star_service", column = "star_service"),
			@Result(property = "star_clean", column = "star_clean"), @Result(property = "cafe_name", column = "cafe_name") })
	ArrayList<ReviewVO> selectByCafeID(@Param("cafe_id") String cafe_id);
	
	// 내가 쓴 리뷰 지우기. 수정은 미구현.
	final String DELETE_FROM_REVIEW = "delete from review where user_id = #{user_id} and password = #{password}";
	@Delete(DELETE_FROM_REVIEW)
	int deleteFromReview(@Param("user_id") String user_id, @Param("password") String password);
	
	
	
	
}
