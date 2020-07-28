package com.sql.cafe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sql.cafe.mapper.ReviewMapper;
import com.sql.cafe.vo.ReviewVO;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	// 리뷰 쓰기.
	public int insertIntoReview(ReviewVO reviewVO) {
		return reviewMapper.insertIntoReview(reviewVO);
	}

	// 내가 쓴 리뷰 보기.
	public ArrayList<ReviewVO> selectByUserID(String user_id) {

		return reviewMapper.selectByUserID(user_id);
	}

	// 현재 카페의 리뷰 보기.
	public ArrayList<ReviewVO> selectByCafeId(String cafe_id) {
		return reviewMapper.selectByCafeID(cafe_id);

	}
	
	public int deletereview(String user_id, String password) {
		return reviewMapper.deleteFromReview(user_id, password);
		
	}
}
