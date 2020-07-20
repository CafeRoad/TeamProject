package com.cafe.caferoad.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberVO {
	private int seq;
	private String userid;
	private String userpw;
	private String username;
	private String status;
	private Date regdate;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberVO [seq=" + seq + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", status=" + status + ", regdate=" + regdate + "]";
	}
	
	

}
