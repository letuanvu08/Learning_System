package com.Learning.common.dao.aaoemployee;

import com.Learning.common.model.lecturer.Lecturer;
import com.Learning.common.model.student.Student;
import com.Learning.common.model.aaoemployee.*;

import java.sql.*;
import java.time.format.SignStyle;
import java.util.ArrayList;
import java.util.List;

public class aaoemployeeDao {
    final private static String mysqlURL="jdbc:mysql://localhost:3306/Learning_Teaching";
    final private static String mysqlUsrName="root";
    final private static String mysqlPass="0974706833vu";

    private static final String PROCEDURE_XEM_DANH_SACH_SV="call xem_ds_sv_dk_1_lop(?,?,?,?)";
    private static final String PROCEDURE_XEM_DANH_SACH_GV="call xem_ds_gv_cua_1_lop(?,?,?,?)";
    private static final String PROCEDURE_THEM_LOP="call them_lop(?,?,?,?,?)";
    private static final String PROCEDURE_XOA_LOP="call xoa_lop(?,?,?,?)";
    private static final String PROCEDURE_cap_nhat_lop="call cap_nhat_lop(?,?,?,?,?,?,?,?,?,?)";

    private static Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn= DriverManager.getConnection(mysqlURL,"root","0974706833vu");
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
    public static String  addClass(String SubjectID, int year, int semester, String subclassID,String lecturerID){
        Connection conn=getConnection();
        String mess="";
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_THEM_LOP);
            preparedStatement.setString(1,SubjectID);
            preparedStatement.setInt(2,year);
            preparedStatement.setInt(3,semester);
            preparedStatement.setString(4,subclassID);
            preparedStatement.setString(5,lecturerID);
            //This line is for debug purpose only
            preparedStatement.execute();
        } catch (SQLException throwables) {
            mess=throwables.getMessage();
        }
        return mess;
    }
    public static String  deleteClass(String SubjectID, int year, int semester, String subclassID){
        Connection conn=getConnection();
        String mess="";
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_XOA_LOP);
            preparedStatement.setString(1,SubjectID);
            preparedStatement.setInt(2,year);
            preparedStatement.setInt(3,semester);
            preparedStatement.setString(4,subclassID);
            //This line is for debug purpose only
            preparedStatement.execute();
        } catch (SQLException throwables) {
            mess=throwables.getMessage();
        }
        return mess;
    }
    public static String  updateClass(String SubjectID, int year, int semester, String subclassID,String lecturerID,String newSubjectID, int newyear, int newsemester, String newsubclassID,String newlecturerID){
        Connection conn=getConnection();
        String mess="";
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_cap_nhat_lop);
            preparedStatement.setString(1,SubjectID);
            preparedStatement.setInt(2,year);
            preparedStatement.setInt(3,semester);
            preparedStatement.setString(4,subclassID);
            preparedStatement.setString(5,lecturerID);
            preparedStatement.setString(6,newSubjectID);
            preparedStatement.setInt(7,newyear);
            preparedStatement.setInt(8,newsemester);
            preparedStatement.setString(9,newsubclassID);
            preparedStatement.setString(10,newlecturerID);
            //This line is for debug purpose only
            preparedStatement.execute();
        } catch (SQLException throwables) {
            mess=throwables.getMessage();
        }
        return mess;
    }

    public static SubclassDetail getSubclassDetail(int year, int semester, String classID, String subclassID){
        SubclassDetail subclassDetail= new SubclassDetail();

        subclassDetail.setListstudent(getListStudentOfSubClass(year, semester, classID, subclassID));
        subclassDetail.setListlecturer(getListLecturerOfSubClass(year, semester, classID, subclassID));
        return subclassDetail;
    }

    public static List<Student> getListStudentOfSubClass(int year, int semester, String classID, String subclassID){
            List<Student> list=new ArrayList<>();
        Connection conn=getConnection();

        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_XEM_DANH_SACH_SV);
            preparedStatement.setInt(1,year);
            preparedStatement.setInt(2,semester);
            preparedStatement.setString(3,classID);
            preparedStatement.setString(4,subclassID);
            //This line is for debug purpose only
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){
                Student student =new Student();
                student.setStudentID(res.getString("StudentID"));
                student.setName(res.getString("FNAME")+" "+res.getString("LNAME"));
                list.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    public static List<Lecturer> getListLecturerOfSubClass(int year, int semester, String classID, String subclassID){
        List<Lecturer> list=new ArrayList<>();
        Connection conn=getConnection();

        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_XEM_DANH_SACH_GV);
            preparedStatement.setInt(1,year);
            preparedStatement.setInt(2,semester);
            preparedStatement.setString(3,classID);
            preparedStatement.setString(4,subclassID);
            //This line is for debug purpose only
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){
                Lecturer student =new Lecturer();
                student.setLecturerID(res.getString("LID"));
                student.setName(res.getString("FNAME")+" "+res.getString("LNAME"));
                list.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
