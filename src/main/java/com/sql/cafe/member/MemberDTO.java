package com.sql.cafe.member;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDTO {

	private String id;
	private String password;
	private String email;
	private Date create_time;
	private String tel;
	private String authority;
	
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public String getTel() {
		return tel;
	}
	public String getAuthority() {
		return authority;
	}
	
	

}
