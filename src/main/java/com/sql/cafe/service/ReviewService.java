package com.sql.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sql.cafe.mapper.ReviewMapper;
import com.sql.cafe.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	


}
