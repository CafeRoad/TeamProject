package com.sql.cafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sql.cafe.mapper.BoardMapper;
import com.sql.cafe.vo.BoardVO;

@Component
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	public List<BoardVO> List() throws Exception {
		return null;
	}
 
}
