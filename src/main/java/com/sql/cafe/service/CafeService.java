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

		cafeMapper.insertToWaitingCafe(cafeVO);
		cafeVO.setCafe_id(cafeMapper.getNowCafeId());
		// 지금 넣은 카페의 cafe_id를 가져와서 cafeVO에 담아야 함.
		cafeMapper.insertToWaitingCafeOption(cafeVO);
	}

	// 접속한 오너의 아이디로 승인 대기중인 카페들 검색.
	public ArrayList<CafeVO> selectWaitingCafesByOwnerId(String owner_id) {
		return this.cafeMapper.selectWaitingCafesByOwnerId(owner_id);

	}

	// 접속한 오너의 아이디로 등록된 카페들 검색.
	public ArrayList<CafeVO> selectAddedCafesByOwnerId(String owner_id) {
		return this.cafeMapper.selectAddedCafesByOwnerId(owner_id);

	}

	// 어드민이 대기중인 모든 카페 리스트를 봄.
	public ArrayList<CafeVO> selectWaitingCafes() {
		return cafeMapper.selectAllFromWaitingCafe();

	}
	
	// 등록된 모든 카페의 리스트 겟.
	public ArrayList<CafeVO> selectAddedCafes() {
		return cafeMapper.selectAllFromAddedCafe();

	}
	
	// 어드민이 승인을 위해 대기중인 특정 카페의 상세 정보를 뿌리는 페이지로 이동.
	public CafeVO searchSpecificWaitingCafe(String cafe_id) {

		return cafeMapper.selectWaitingCafeByCafeId(cafe_id);
	}

	// 어드민이 카페를 승인하면 waiting_cafe 에서 added_cafe 로 이동. 옵션도.
	public int approveCafe(String cafe_id) {

		CafeVO cafeVO = cafeMapper.selectWaitingCafeByCafeId(cafe_id);

		cafeMapper.insertToAddedCafe(cafeVO);
		cafeMapper.insertToAddedCafeOption(cafeVO);

		// 리턴되는 인트가 1이면 1개의 행이 삭제됨. 정상.
		return cafeMapper.deleteFromWaitingCafe(cafe_id);

	}

	// 내가 즐겨찾기한 카페 리스트 검색.
	public ArrayList<CafeVO> myFavoriteCafes(String user_id) {
		return cafeMapper.myFavoriteCafes(user_id);
	}

	// 클릭하면 카페의 아이디로 검색해서 특정 카페의 상세 정보를 뿌리는 페이지로 이동.
	public CafeVO selectAddedCafeByCafeId(String cafe_id) {
		return cafeMapper.selectAddedCafeByCafeId(cafe_id);
	}

	// 즐겨찾기 버튼으로 즐겨찾기 테이블에 정보 주가.
	public int toFavorite(String user_id, String cafe_id) {
		return cafeMapper.toFavorite(user_id, cafe_id);
	}
	
	// 다시 즐겨찾기 버튼으로 즐겨찾기 취소. 즐겨찾기 테이블에서 삭제.
	public int deleteFavorite(String user_id, String cafe_id) {
		return cafeMapper.deleteFavorite(user_id, cafe_id);
	}
}
