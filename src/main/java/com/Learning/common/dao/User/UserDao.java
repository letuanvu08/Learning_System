package com.Learning.common.dao.User;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.user.User;
import com.Learning.common.model.user.UserType;

public class UserDao {
	final private static String mysqlURL="jdbc:mysql://localhost:3306/";
	final private static String mysqlUsrName="root";

	// final private static String mysqlPass="soni1382000duy";
	final private static String mysqlPass="0974706833vu";
	//final private static String mysqlPass="8pJ-:G&b}aPUP9*6";
	private static String getDatabaseNameAccount() {
		String databaseName="LEARNING_TEACHING_ACCOUNT";
		return databaseName;
	}
	private static String getDatabaseNameLearning() {
		String databaseName="Learning_Teaching1";
		return databaseName;
	}
	//The queries

	private static final String SELECT_USER_BY_ID = "call GET_ACCOUNT_ID(?)";
	private static final String SELECT_USER_BY_USER_NAME = "call GET_ACCOUNT_NAME(?)";
	private static final String GET_TYPE_ACCOUNT_ID = "call GET_TYPE_ACCOUNT_ID(?)";

	private static final String UPDATE_USER_PASS_BY_USER_NAME = "UPDATE Account set PASSWORD=? where USERNAME=?";
	private static final String GET_EMPLOYEE="call  GET_EMPLOYEE(?)";
	//Same as insert User
	//Same as selectUserByUserName
	public static User getUserFromUsername(String username) {
		//return UserData.getInstance().getUserFromUsername(username);
		return selectUserByUserName(username);
	}
	
	//Same as selectUserByID
	public static User getUserFromUserID(String userID) {
		//return UserData.getInstance().getUserFromUserID(userID);
		return selectUserByID(userID);
	}
	public static Employee getEmployeeByID(String id){
		Connection conn=getConnection(getDatabaseNameLearning());
		Employee employee =new Employee();
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(GET_EMPLOYEE);
			preparedStatement.setString(1, id);
			//This line is for debug purpose only
			ResultSet res=preparedStatement.executeQuery();

			while (res.next()) {
				employee.setId(res.getString("ID"));
				employee.setFacultyName(res.getString("FACULTYNAME"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return employee;
	}

	public static void changePasswordFromUsername(String username,String newpassword) {
        //UserData.getInstance().changePasswordFromUsername(username,newpassword);
		updateUserPassword(newpassword, username);
	}

	
	public UserDao() {
		
	}
	

	//Get the database connection
	private static Connection getConnection(String datatbase) {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(mysqlURL+datatbase,mysqlUsrName, mysqlPass);
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	//Insert a created user object to database (user include user_name, pass and role)



	public static User getInForAccount(String  id,User user) {

		Connection conn=getConnection(getDatabaseNameLearning());
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(GET_TYPE_ACCOUNT_ID);
			preparedStatement.setString(1, id);
			//This line is for debug purpose only
			ResultSet res=preparedStatement.executeQuery();

			while (res.next()) {
				String username=res.getString("Fname")+" "+res.getString("Lname");
				String userType = res.getString("TYPEUSER");
				String email = res.getString("Email");

				for (UserType iterator: UserType.values()) {
					//This line is for debug purpose only
					if (iterator.toString().equals(userType)) {
						user.setUserType(iterator);
						break;
					}
				}
				user.setUsername(username);
				user.setEmail(email);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return user;
	}
	
	//Select user by id
	public static User selectUserByID(String  id) {
		User user = new User();
		Connection conn=getConnection(getDatabaseNameAccount());
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(SELECT_USER_BY_ID);
			preparedStatement.setString(1, id);
			//This line is for debug purpose only
			ResultSet res=preparedStatement.executeQuery();
			
			while (res.next()) {
				String  iduser = res.getString("USERID");
				String password = res.getString("PASSWORD");
				getInForAccount(id,user);
				System.out.println(user.getUserType());
				user.setUserID(iduser);
				user.setpassword(password);
			}
		 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	//Select user by name 
	public static User selectUserByUserName(String userName) {
		User user= null;
		Connection conn=getConnection(getDatabaseNameAccount());
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(SELECT_USER_BY_USER_NAME);
			preparedStatement.setString(1, userName);
			ResultSet res=preparedStatement.executeQuery();
			while (res.next()) {
				user = new User();
				String  id = res.getString("USERID");
				String password = res.getString("PASSWORD");
				getInForAccount(id,user);
				user.setUserID(id);
				user.setpassword(password);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	

	

	//Update user password through user name
	public static boolean updateUserPassword(String newPassword, String userName) {
		boolean isUpdated = false;
		//Simple handle exception
		if (newPassword =="") return isUpdated;
		Connection conn=getConnection(getDatabaseNameAccount());
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(UPDATE_USER_PASS_BY_USER_NAME);

			preparedStatement.setString(1, newPassword);
			preparedStatement.setString(2, userName);

			isUpdated=preparedStatement.executeUpdate()>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isUpdated;
	}



}
