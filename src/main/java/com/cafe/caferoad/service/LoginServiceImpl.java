package com.cafe.caferoad.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.caferoad.vo.MemberVO;

//@Service
//public class LoginServiceImpl implements LoginService {
//	@Autowired
//	LoginDAO dao;
//
//	@Override
//	public String loginPro(MemberVO vo, HttpSession session) throws Exception {
//		// TODO Auto-generated method stub
//		String status = dao.loginPro(vo);
//		if (status == null) {
//			return null;
//		} else {
//			session.setAttribute("status", status);
//			session.setAttribute("userid", vo.getUserid());
//			return status;
//		}
//	}

//}
