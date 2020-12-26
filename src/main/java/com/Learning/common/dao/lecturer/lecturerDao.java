package com.Learning.common.dao.lecturer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class lecturerDao {

    final private static String mysqlURL = "jdbc:mysql://localhost:3306/Learning_Teaching1";
    final private static String mysqlUsrName = "root";
    final private static String mysqlPass = "0974706833vu";

    private static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(mysqlURL, mysqlUsrName, mysqlPass);
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



}
