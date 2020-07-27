package com.sql.cafe.vo;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Repository;

@Repository
public class MemberVO {
	
	@NotBlank(message="아이디를 입력해주세요.")
	@Size(min=6,max=16,message = "아이디는 6~15자 이내로 설정해 주세요.")
	private String id;
	
	@NotBlank(message = "비밀번호를 6~15자 이내로 입력해주세요.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=\\S+$).{6,20}",
     message = "비밀번호는 영문 대,소문자와 숫자를 1개 이상씩 포함해 주세요.")
	private String password;
	
	private String passwordcheck;
	
	@Email(message = "[@],[.]을 포함한 올바른 이메일 주소를 입력해 주세요.")
	@Pattern(regexp = ".+@.+\\..+",message = "이메일을 입력해 주세요.")
	private String email;
	
	@NotBlank(message = "이름을 입력해주세요.")
	@Size(min=2,max=8,message = "이름은 2~8자 이내로 입력해 주세요.")
	private String name;
	
	@NotBlank(message = "닉네임을 입력해 주세요.")
	@Size(min=2,max=8,message = "닉네임은 2~8자 이내로 설정해 주세요.")
	private String nickname;
	
	
	private String gu;
	private Date create_time;
	
	private String tel;
	
	private String authority;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getPasswordcheck() {
		return passwordcheck;
	}
	public void setPasswordcheck(String passwordcheck) {
		this.passwordcheck = passwordcheck;
	}



}
