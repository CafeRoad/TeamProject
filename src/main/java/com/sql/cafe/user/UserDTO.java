package com.sql.cafe.user;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class UserDTO {

	String user_id;
	String password;
	String email;
	String gender;
	String nickname;
	String local;
	String birth;
	String interesting;
	Date create_time;
	
	public String getUser_id() {
		return user_id;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}
	public String getGender() {
		return gender;
	}
	public String getNickname() {
		return nickname;
	}
	public String getLocal() {
		return local;
	}
	public String getBirth() {
		return birth;
	}
	public String getInteresting() {
		return interesting;
	}
	public Date getCreate_time() {
		return create_time;
	}
	
	
	
}
