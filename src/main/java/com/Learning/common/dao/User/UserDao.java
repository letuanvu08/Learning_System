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

	//The queries
	private static final String INSERT_USERS_SQL = "INSERT INTO user_info_normal (User_ID, User_Name, User_Type,Name, Password, Balance, Email) VALUES (?, ?, ?, ?, ?, ?, ?) ";
	private static final String GET_USERS_MAX_ID = "SELECT MAX(User_ID) AS MaxUserID FROM user_info_normal";

	private static final String SELECT_USER_BY_ID = "call GET_ACCOUNT_ID(?)";
	private static final String SELECT_USER_BY_USER_NAME = "call GET_ACCOUNT(?)";
	private static final String SELECT_ALL_USERS = "SELECT * FROM user_info_normal";
	private static final String UPDATE_USER_PASS_BY_USER_NAME = "UPDATE Account set PASSWORD=? where USERNAME=?;";
	private static final String GET_EMPLOYEE="select EmployeeID ID,FEName FACULTYNAME from Employee where PersonalEID=?";
	//Same as insert User
	public static void addNewUser(User user){
		//UserData.getInstance().addNewUser(user);
		insertUser(user);
	}
	
	public static List<User> getUsers() {
		return selectAllUser();
	}
	
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
		Connection conn=getConnection();
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
	
	private static String getDatabaseName() {
		String databaseName="Learning_Teaching";
		return databaseName;
	}
	//Get the database connection
	private static Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(mysqlURL+getDatabaseName(),mysqlUsrName, mysqlPass);
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
	public static void insertUser(User user) {
		Connection conn=getConnection();
		
		try {
			PreparedStatement getMaxUserID=conn.prepareStatement(GET_USERS_MAX_ID);
			ResultSet res=getMaxUserID.executeQuery();
			res.next();
			int userIDToAdd=res.getInt("MaxUserID")+1;
				
			PreparedStatement preparedStatement=conn.prepareStatement(INSERT_USERS_SQL);
			preparedStatement.setLong(1, userIDToAdd);
			preparedStatement.setString(2, user.getUsername());
			preparedStatement.setString(3, user.getUserType().toString());
			preparedStatement.setNString(4, user.getUsername());
			preparedStatement.setString(5, user.getpassword());
			preparedStatement.setString(6, "0");
			preparedStatement.setString(7, user.getemail());
			preparedStatement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		} 
		
		
		
	}
	
	//Select user by id
	public static User selectUserByID(String  id) {
		User user = null;
		Connection conn=getConnection();
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(SELECT_USER_BY_ID);
			preparedStatement.setString(1, id);
			//This line is for debug purpose only
			ResultSet res=preparedStatement.executeQuery();
			
			while (res.next()) {
				user = new User();
				String  iduser = res.getString("USERID");

				String Accountname = res.getString("USERNAME");
				String username=res.getString("Fname")+" "+res.getString("Lname");
				String userType = res.getString("TYPEUSER");
				String password = res.getString("PASSWORD");

				String email = res.getString("Email");
//				String phone=res.getString("Phone");
				
				//Convert String to UserType object
				for (UserType iterator: UserType.values()) {
						//This line is for debug purpose only
					if (iterator.toString().equals(userType)) {

						user.setUserType(iterator);
						break;
					}
				}
				user.setUserID(iduser);
				user.setAccountName(Accountname);
				user.setUsername(username);
				user.setpassword(password);

				user.setEmail(email);
//				user.setPhone(phone);
				
				//Dude, you have to get order which isDone column == 2, later then 

				
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
		Connection conn=getConnection();
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(SELECT_USER_BY_USER_NAME);
			preparedStatement.setString(1, userName);
			ResultSet res=preparedStatement.executeQuery();
			while (res.next()) {
				user = new User();
				String  id = res.getString("USERID");

				String Accountname = res.getString("USERNAME");
				String username=res.getString("Fname")+" "+res.getString("Lname");
				String userType = res.getString("TYPEUSER");
				String password = res.getString("PASSWORD");

				String email = res.getString("Email");
//				String phone = res.getString("Phone");
				//Convert String to UserType object
				for (UserType iterator : UserType.values()) {

					if (iterator.toString().equals(userType)) {
						user.setUserType(iterator);
						break;
					}
				}
				user.setUserID(id);

				user.setAccountName(Accountname);
				user.setpassword(password);

				user.setEmail(email);
//				user.setPhone(phone);
			}

				
				//Dude, you have to get order which isDone column == 2, later then 


		 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	//Select all user
	public static List<User> selectAllUser() {
		List<User> userList=new ArrayList<User>();
		Connection conn=getConnection();
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(SELECT_ALL_USERS);
			ResultSet res=preparedStatement.executeQuery();
			
			while (res.next()) {
				User user = new User();
				String id = res.getString("USERID");

				String Accountname = res.getString("USERNAME");
				String username=res.getString("Fname")+res.getString("Lname");
				String userType = res.getString("TYPEUSER");
				String password = res.getString("PASSWORD");

				String email = res.getString("Email");
				String phone=res.getString("Phone");
				
				//Convert String to UserType object
				for (UserType iterator: UserType.values()) {
					if (iterator.toString().equals(userType)) {
						user.setUserType(iterator);
						break;
					}
				}
				user.setUserID(id);
				user.setAccountName(Accountname);
				user.setUsername(username);
				user.setpassword(password);

				user.setEmail(email);
				user.setPhone(phone);
				
				
				//Dude, you have to get order which isDone column == 2, later then 

				userList.add(user);
			}
		 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userList;
	}
	
	//Delete user by id
//	public static boolean deleteUserByID(long userID) {
//		boolean isDeleted = false;
//		Connection connection = getConnection();
//	    PreparedStatement statement;
//	    User tempUser = selectUserByID(userID);
//	    if (tempUser.getUserType() == UserType.FC_MANAGER) return isDeleted;
//		try {
//			statement = connection.prepareStatement(DELETE_USER_BY_ID);
//			statement.setLong(1, userID);
//		    isDeleted = statement.executeUpdate() > 0;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	    return isDeleted;
//	}
	
	//Update user password through user name
	public static boolean updateUserPassword(String newPassword, String userName) {
		boolean isUpdated = false;
		//Simple handle exception
		if (newPassword =="") return isUpdated;
		Connection conn=getConnection();
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(UPDATE_USER_PASS_BY_USER_NAME);
			System.out.println(newPassword);
			System.out.println(userName);

			preparedStatement.setString(1, newPassword);
			preparedStatement.setString(2, userName);

			isUpdated=preparedStatement.executeUpdate()>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isUpdated;
	}

	//Update user password through user id


	//Update user balance through user id

	//Update user balance through user id


	//Update user name

	//Update user phone



}
