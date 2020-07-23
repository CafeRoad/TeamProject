package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.BoardVO;

@Repository
public interface BoardMapper {

	final String INSERT_MP_BOARD = "insert into mp_board (bno, title, content, writer) values (#{bno}, #{title}, #{content}, #{writer})";

	@Insert(INSERT_MP_BOARD)
	void insertWrite(BoardVO vo);
}
