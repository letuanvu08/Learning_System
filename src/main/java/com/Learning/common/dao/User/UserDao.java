package com.Learning.common.dao.User;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.user.User;
import com.Learning.common.model.user.UserType;

public class UserDao {
	final private static String mysqlURL="jdbc:mysql://localhost:3306/";
	final private static String mysqlUsrName="Author";
	final private static String mysqlPass="Authorizer";

	private static String getDatabaseNameAccount() {
		String databaseName="LEARNING_TEACHING_ACCOUNT";
		return databaseName;
	}
	private static String getDatabaseNameLearning() {
		String databaseName="Learning_Teaching";
		return databaseName;
	}
	//The queries

	private static final String SELECT_USER_BY_ID = "call GET_ACCOUNT_ID(?)";
	private static final String SELECT_USER_BY_USER_NAME = "call GET_ACCOUNT_NAME(?)";
	private static final String GET_TYPE_ACCOUNT_ID = "call GET_TYPE_ACCOUNT_ID(?)";

	private static final String UPDATE_USER_PASS_BY_USER_NAME = "call CHANGE_PASSWORD_ACCOUNT(?,?,?)";
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

	public static String  changePasswordFromUsername(String username,String oldpassword,String newpassword) {
        //UserData.getInstance().changePasswordFromUsername(username,newpassword);
		return updateUserPassword(username,oldpassword, newpassword);
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
		User user = null;
		Connection conn=getConnection(getDatabaseNameAccount());
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(SELECT_USER_BY_ID);
			preparedStatement.setString(1, id);
			//This line is for debug purpose only
			ResultSet res=preparedStatement.executeQuery();
			while (res.next()) {
				user=new User();
				String iduser = res.getString("USERID");
				String password = res.getString("PASSWORD");
				String accountName = res.getString("USERNAME");



				getInForAccount(id,user);
				user.setUserID(iduser);
				user.setpassword(password);
				user.setAccountName(accountName);
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
				user.setAccountName(userName);
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
	public static String  updateUserPassword(String userName,String Old_password, String newPassword) {
		String mess="";
		//Simple handle exception
		Connection conn=getConnection(getDatabaseNameAccount());
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(UPDATE_USER_PASS_BY_USER_NAME);
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, Old_password);
			preparedStatement.setString(3, newPassword);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			mess=e.getMessage();
		}
		return mess;
	}



}
