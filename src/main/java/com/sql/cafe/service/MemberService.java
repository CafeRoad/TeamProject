package com.sql.cafe.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.sql.cafe.helper.MailHandler;
import com.sql.cafe.helper.TempKey;
import com.sql.cafe.mapper.MemberMapper;
import com.sql.cafe.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private JavaMailSender mailSender;

	// 로그인 된 아이디의 정보를 받아 옴.
	public MemberVO selectMemberById(String id) {
		return this.memberMapper.selectMemberById(id);
	}

	// 회원가입 폼에서 받은 정보에 인증키를 추가하여 인서트.
	public void insertNewMember(MemberVO memberVO) throws Exception {

		String key = new TempKey().generateKey(8); // 인증키 생성
		System.out.println("key : " + key);

		System.out.println("인서트 뉴 멤버에서 확인 " + memberVO.getId());
		// 인증 키 생성해서 Authority column으로.
		memberVO.setAuthority(key);

		// DB에 가입 정보 insert하고 메일 보내기.
		this.memberMapper.insertNewMember(memberVO);

		// 메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("서비스 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append(memberVO.getId()).append("님 가입을 환영합니다.<br/>")
				.append("<a href='http://localhost:8080/cafe/userEmailConfirm?authKey=").append(key)
				.append("' target='_blank'>이메일 인증 확인</a>").toString());

		sendMail.setFrom("caferoadteam@gmail.com", "팀 카페로드.");
		sendMail.setTo(memberVO.getEmail());
		sendMail.send();

	}

	// 이메일 인증 키 검증
	public MemberVO updateToUser(String authkey) throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO = memberMapper.selectMemberByAuthority(authkey);

		// null이 아니면, 해당 키를 가진 유저가 있으면. 인증키 값을 'USER'로 바꿈.
		if (memberVO != null) {
			try {
				memberMapper.updateToUser(authkey);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memberVO;
	}
	
	public MemberVO login(String id, String password) {
		
		return memberMapper.login(id, password);
	}
}
