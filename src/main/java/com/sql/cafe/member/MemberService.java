package com.sql.cafe.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	
	@Autowired
	private MemberMapper memberMapper;
	
	public MemberDTO getSpecificRow(String id) {
		return this.memberMapper.getSpecificRow(id);

	}
}
