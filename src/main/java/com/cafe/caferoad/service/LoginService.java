package com.cafe.caferoad.service;

import javax.servlet.http.HttpSession;

import com.cafe.caferoad.vo.MemberVO;

public interface LoginService {
	public String loginPro(MemberVO vo, HttpSession session) throws Exception;

}
