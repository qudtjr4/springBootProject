package com.csis3275.model_riphumi;

import javax.persistence.Enumerated;

public class User_riphumi {
	private int id;
	private String username;
	private String password;
	private String email;
	private String address;
	private long phoneNum;
	private String dateOfBirth;
	private UserType userType;
	
	
	
	public User_riphumi() {
		super();
		this.password = "";
		this.email = "";
		this.address ="";
		this.phoneNum =0;
		this.dateOfBirth = "";
		this.userType = UserType.STUDENT;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(long phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public UserType getUserType() {
		return userType;
	}
	public void setUserType(UserType userType) {
		this.userType = userType;
	}

}
