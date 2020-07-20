package com.cafe.caferoad.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe.caferoad.vo.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	@Autowired
	SqlSession session;

	@Override
	public String loginPro(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("cafe.logincheck", vo);
	}

}
