package com.sql.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sql.cafe.mapper.BoardMapper;
import com.sql.cafe.vo.BoardVO;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;

	public void insertWrite(BoardVO vo) {
		boardMapper.insertWrite(vo);
	}

}
