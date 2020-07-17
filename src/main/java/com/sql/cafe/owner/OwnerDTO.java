package com.sql.cafe.owner;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class OwnerDTO {

	String owner_id;
	String password;
	String email;
	String tel;
	Date create_time;

	public String getOwner_id() {
		return owner_id;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getTel() {
		return tel;
	}

	public Date getCreate_time() {
		return create_time;
	}

}
