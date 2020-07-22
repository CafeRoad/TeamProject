package com.sql.cafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sql.cafe.mapper.ReviewMapper;
import com.sql.cafe.vo.ReviewVO;

@Component
public class ReviewService {
	
	@Autowired
	private ReviewMapper boardMapper;
	
	public List<ReviewVO> List() throws Exception {
		return null;
	}
 
}
