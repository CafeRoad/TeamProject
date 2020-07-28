package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.ReviewVO;


@Repository
public interface ReviewMapper {
	
	//리뷰 쓰면 넣기.
	final String INSERT_INTO_REVIEW = "insert into review (review_name, user_id, cafe_id, password, create_time, content, stars, star_taste, star_mood, star_service, star_clean) values(#{review_name}, #{user_id}, #{cafe_id}, #{password}, now(), #{content}, (#{star_taste} + #{star_mood} + #{star_service} + #{star_clean}) / 4, #{star_taste}, #{star_mood}, #{star_service}, #{star_clean})";
	
	@Insert(INSERT_INTO_REVIEW)
	int insertIntoReview(ReviewVO reviewVO);
	
	// 유저의 아이디로 내가 쓴 리뷰 모아보기.
	
	
	// 카페 아이디로 카페에 쓰여진 리뷰 보기.
	
	
}
