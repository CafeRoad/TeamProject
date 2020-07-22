package com.sql.cafe.vo;

import java.util.Date;

public class CafeVO {
	
	// Cafe Table column
	private String cafe_id;
	private String owner_id;
	private String cafe_name;
	private String gu;
	private String address;
	private String sns;
	private boolean event;
	private String homepage;
	private String intro;
	private Date create_time;
	
	// Cafe Option Table column  
//	private String cafe_id;
	private boolean concent;
	private boolean pet;
	private int seat;
	private boolean wifi;
	private boolean local_money;
	private boolean parking_zone;
	private int sdutyroom;
	private String toilet;
	
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	

	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSns() {
		return sns;
	}
	public void setSns(String sns) {
		this.sns = sns;
	}
	public boolean isEvent() {
		return event;
	}
	public void setEvent(boolean event) {
		this.event = event;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public boolean isConcent() {
		return concent;
	}
	public void setConcent(boolean concent) {
		this.concent = concent;
	}
	public boolean isPet() {
		return pet;
	}
	public void setPet(boolean pet) {
		this.pet = pet;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public boolean isWifi() {
		return wifi;
	}
	public void setWifi(boolean wifi) {
		this.wifi = wifi;
	}
	public boolean isLocal_money() {
		return local_money;
	}
	public void setLocal_money(boolean local_money) {
		this.local_money = local_money;
	}
	public boolean isParking_zone() {
		return parking_zone;
	}
	public void setParking_zone(boolean parking_zone) {
		this.parking_zone = parking_zone;
	}
	public int getSdutyroom() {
		return sdutyroom;
	}
	public void setSdutyroom(int sdutyroom) {
		this.sdutyroom = sdutyroom;
	}
	public String getToilet() {
		return toilet;
	}
	public void setToilet(String toilet) {
		this.toilet = toilet;
	}
	
	
	
}
