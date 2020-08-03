package com.sql.cafe.vo;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Repository;

@Repository
public class ReviewVO {
	private int review_id;
	
	@NotBlank(message="제목을 입력해주세요.")
	@Size(min=3,max=20,message = "제목은 3~20자 이내로 입력해 주세요.")
	private String review_name;
	
	private String user_id;
	private int cafe_id;
	
	@NotBlank(message="비밀번호를 입력해 주세요.")
	@Size(min=4,max=10,message = "비밀번호는 4~10자로 입력해 주세요.")
	private String password;
	
	private Date create_time;
	
	@NotBlank(message="내용을 입력해 주세요.")
	@Size(min=5,max=2000,message = "내용은 5~2000자 까지 입력 할 수 있습니다.")
	private String content;
	
	private double stars;
	private double star_taste;
	private double star_mood;
	private double star_service;
	private double star_clean;
	
	private String cafe_name;
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_name() {
		return review_name;
	}
	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getStars() {
		return stars;
	}
	public void setStars(double stars) {
		this.stars = stars;
	}
	public double getStar_taste() {
		return star_taste;
	}
	public void setStar_taste(double star_taste) {
		this.star_taste = star_taste;
	}
	public double getStar_mood() {
		return star_mood;
	}
	public void setStar_mood(double star_mood) {
		this.star_mood = star_mood;
	}
	public double getStar_service() {
		return star_service;
	}
	public void setStar_service(double star_service) {
		this.star_service = star_service;
	}
	public double getStar_clean() {
		return star_clean;
	}
	public void setStar_clean(double star_clean) {
		this.star_clean = star_clean;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	
	
}
