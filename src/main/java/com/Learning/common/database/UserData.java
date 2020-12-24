package com.Learning.common.database;

import java.util.ArrayList;
import java.util.List;

import com.Learning.common.model.user.User;

public class UserData {
	List<User> users;
	private static UserData instance;

	public static UserData getInstance() {
		if (instance == null) instance = new UserData();
		return instance;
	}

	private UserData () {
		users = new ArrayList<User>();

	}
	public void addNewUser(User user) {
		users.add(new User(user));
	}
//	public void removeUserFromID(Integer ID) {
//		users.removeIf((n) -> ((n.getUserID() == ID) && (n.getUserType() != UserType.FC_MANAGER)));
//	}
	public List<User> getUsers(){
		List<User> user = new ArrayList<User>();
		for (User o: users) {
			user.add(new User(o));
		}
		return user;
	}
	
	public User getUserFromUsername(String username) {
		for (User u: users) {
			if (u.getUsername().equals(username)) {
				return new User(u);
			}
		}
		return null;
	}
	public void changePasswordFromUsername(String username,String newpassword) {
		for (User u: users) {
			if (u.getUsername().equals(username)) {
				u.setpassword(newpassword);
				return;
			}
		}
		return;
	}
	
	public User getUserFromUserID(String  userID) {
		for (User u: users) {
			if (u.getUserID() == userID) {
				return new User(u);
			}
		}
		return null;
	}
}
	
