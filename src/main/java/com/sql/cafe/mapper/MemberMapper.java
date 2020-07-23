package com.sql.cafe.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.sql.cafe.vo.MemberVO;

@Repository
public interface MemberMapper {
	// 아이디로 정보 검색.
	final String SELECT_BY_ID = "select * from member where id = #{id}";

	@Select(SELECT_BY_ID)
	@Results(value = { @Result(property = "id", column = "id"), @Result(property = "password", column = "password"),
			@Result(property = "email", column = "email"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "tel", column = "tel"), @Result(property = "authority", column = "authority") })
	MemberVO selectMemberById(@Param("id") String id);

	// 회원가입.
	final String INSERT_NEW_MEMBER = "insert into member (id, password, email, create_time, tel, authority) values (#{id}, #{password}, #{email}, now(), #{tel}, #{authority})";

	@Insert(INSERT_NEW_MEMBER)
	void insertNewMember(MemberVO memberVO);

	// 인증키로 정보 검색. 이메일 인증하는 동작에서만 사용됨.
	final String SELECT_BY_AUTHKEY = "select * from member where authority = #{authority}";

	@Select(SELECT_BY_AUTHKEY)
	@Results(value = { @Result(property = "id", column = "id"), @Result(property = "password", column = "password"),
			@Result(property = "email", column = "email"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "tel", column = "tel"), @Result(property = "authority", column = "authority") })
	MemberVO selectMemberByAuthority(@Param("authority") String authority);

	// Authority가 일치하는 행을 유저 권한으로 변경.
	final String UPDATE_TO_USER = "update member set authority = 'USER' where authority = #{authority}";

	@Update(UPDATE_TO_USER)
	int updateToUser(@Param("authority") String authority);

	// Authority가 일치하는 행을 오너 권한으로 변경.
	final String UPDATE_TO_OWNER = "update member set authority = 'OWNER' where authority = #{authority}";

	@Update(UPDATE_TO_OWNER)
	int updateToOwner(@Param("authority") String authority);
	
	// 로그인.
	final String LOGIN = "select * from member where id = #{id} and password = #{password}";

	@Select(LOGIN)
	@Results(value = { @Result(property = "id", column = "id"), @Result(property = "password", column = "password"),
			@Result(property = "email", column = "email"), @Result(property = "create_time", column = "create_time"),
			@Result(property = "tel", column = "tel"), @Result(property = "authority", column = "authority") })
	MemberVO login(@Param("id") String id, @Param("password") String password);
	
	// 회원탈퇴.
	final String DELETE = "delete from member where id = #{id} and password = #{password}";
	@Delete(DELETE)
	int delete(@Param("id") String id, @Param("password") String password); 
}


	
