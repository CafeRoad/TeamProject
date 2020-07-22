package com.sql.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sql.cafe.mapper.CafeMapper;
import com.sql.cafe.vo.CafeVO;

@Service
public class CafeService {

	@Autowired
	private CafeMapper cafeMapper;

	// 카페 등록 폼에서 받은 정보로 waiting_cafe에 insert
	public void insertNewCafe(CafeVO cafeVO) {

		cafeMapper.insertNewCafeToCafe(cafeVO);
		cafeMapper.insertNewCafeToCafeOption(cafeVO);
	}

	public CafeVO selectWaitingCafeByOwnerId(String owner_id) {
		return this.cafeMapper.selectWaitingCafeByOwnerId(owner_id);

	}

}
