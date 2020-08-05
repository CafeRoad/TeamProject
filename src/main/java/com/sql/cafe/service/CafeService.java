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
	public int insertNewCafe(CafeVO cafeVO) {

		return cafeMapper.insertToWaitingCafe(cafeVO);
	}

	// 접속한 오너의 아이디로 승인 대기중인 카페들 검색.
	public ArrayList<CafeVO> selectWaitingCafesByOwnerId(String owner_id, int selectPage) {
		return this.cafeMapper.selectWaitingCafesByOwnerId(owner_id, selectPage);

	}

	// 페이징을 위해 해당 오너의 대기중인 카페의 갯수 얻기.
	public int countWaitingCafeByOwnerId() {
		return cafeMapper.countWaitingCafeByOwnerId();
	}

	// 접속한 오너의 아이디로 등록된 카페들 검색.
	public ArrayList<CafeVO> selectAddedCafesByOwnerId(String owner_id, int selectPage) {
		return this.cafeMapper.selectAddedCafesByOwnerId(owner_id, selectPage);

	}

	// 페이징을 위해 해당 오너의 등록된 카페의 갯수 얻기.
	public int countAddedCafeByOwnerId() {
		return cafeMapper.countAddedCafeByOwnerId();
	}

	// 어드민이 대기중인 모든 카페 리스트를 봄.
	public ArrayList<CafeVO> selectWaitingCafes(int selectPage) {
		return cafeMapper.selectAllFromWaitingCafe(selectPage);

	}

	// 페이징을 위해 모든 대기중인 카페의 갯수 얻기.
	public int countWaitingCafe() {
		return cafeMapper.countWaitingCafe();
	}

	// 등록된 모든 카페의 리스트 겟.
	public ArrayList<CafeVO> selectAddedCafes(int selectPage) {
		return cafeMapper.selectAllFromAddedCafe(selectPage);

	}

	// 페이징을 위해 모든 등록된 카페의 갯수 얻기.
	public int countAddedCafe() {
		return cafeMapper.countAddedCafe();
	}

	// 어드민이 승인을 위해 대기중인 특정 카페의 상세 정보를 뿌리는 페이지로 이동.
	public CafeVO searchSpecificWaitingCafe(String cafe_id) {

		return cafeMapper.selectWaitingCafeByCafeId(cafe_id);
	}

	// 어드민이 카페를 승인하면 waiting_cafe 에서 added_cafe 로 이동. 옵션도.
	public void approveCafe(String cafe_id) {

		CafeVO cafeVO = cafeMapper.selectWaitingCafeByCafeId(cafe_id);

		cafeMapper.insertToAddedCafe(cafeVO);

	}

	// 내가 즐겨찾기한 카페 리스트 검색.
	public ArrayList<CafeVO> myFavoriteCafes(String user_id, int selectPage) {
		return cafeMapper.myFavoriteCafes(user_id, selectPage);
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

	// 즐겨찾기 갯수
	public int countFavoriteCafe() {
		return cafeMapper.countFavoriteCafe();

	}

	// 이름이나 지역으로 검색하기
	public ArrayList<CafeVO> searchByCafe(String search, int selectPage) {
		return cafeMapper.searchByCafe(search, selectPage);

	}

	// 페이징을 위해 검색어에 해당되는 튜플의 갯수 얻기.
	public int selectCountSearch(String search) {
		return cafeMapper.selectCountSearch(search);

	}

	// cafe_id의 최대값 얻어오기.
	public int selectMaxCafeId() {
		return cafeMapper.selectMaxCafeId();

	}
	// 아티클을 클릭해서 얻어오기.
	public ArrayList<CafeVO> getArticleCafes(String article_name) {
		return cafeMapper.getArticleCafes(article_name);

	}
	

}
