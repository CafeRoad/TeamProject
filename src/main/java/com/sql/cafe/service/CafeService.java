package com.sql.cafe.service;

import java.util.ArrayList;

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

	// 접속한 오너의 아이디로 승인 대기중인 카페들 검색.
	public ArrayList<CafeVO> selectWaitingCafesByOwnerId(String owner_id) {
		return this.cafeMapper.selectWaitingCafesByOwnerId(owner_id);

	}
	
	// 접속한 오너의 아이디로 등록된 카페들 검색.
	public ArrayList<CafeVO> selectAddedCafesByOwnerId(String owner_id) {
		return this.cafeMapper.selectAddedCafesByOwnerId(owner_id);

	}
	
	// 어드민이 카페를 승인하면 waiting_cafe 에서 added_cafe 로 이동. 옵션도.
	
	
	// 접속한 오너의 아이디로 대기중인 카페를 검색.
	// 리스트로 돌려야 함.
	
	// 클릭하면 카페의 아이디로 검색해서 특정 카페의 상세 정보를 뿌리는 페이지로 이동.

}
