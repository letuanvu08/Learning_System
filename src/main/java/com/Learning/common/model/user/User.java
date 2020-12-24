package com.Learning.common.model.user;

public class User {
	private String  userID;
	private String AccountName;
	private String username;
	private UserType userType;
	private String password;
	private String email;

	private String phone;


	public User() { }

	public User(User user) {
		this.userID = user.userID;
		this.userType = user.userType;
		this.password = user.password;
		this.email = user.email;
		this.phone=user.phone;

	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String  userID) {
		this.userID = userID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public UserType getUserType() {
		return userType;
	}
	public void setUserType(UserType userType) {
		this.userType = userType;
	}
	public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password = password;
	}
	public String getemail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAccountName() {
		return AccountName;
	}

	public void setAccountName(String accountName) {
		AccountName = accountName;
	}
}
