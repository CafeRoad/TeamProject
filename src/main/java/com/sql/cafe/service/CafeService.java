package com.sql.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sql.cafe.mapper.CafeMapper;
import com.sql.cafe.vo.CafeVO;
import com.sql.cafe.vo.Cafe_optionVO;

@Service
public class CafeService {

	@Autowired
	private CafeMapper cafeMapper;

	// 카페 등록 폼에서 받은 정보로 waiting_cafe에 insert
	public void insertNewCafe(CafeVO cafeVO, Cafe_optionVO cafe_optionVO) {

		cafeMapper.insertNewCafeToCafe(cafeVO);
		cafeMapper.insertNewCafeToCafeOption(cafe_optionVO);
	}
}
