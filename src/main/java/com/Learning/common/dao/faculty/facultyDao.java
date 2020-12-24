package com.Learning.common.dao.faculty;

import com.Learning.common.model.aaoemployee.Facultydetail;
import com.Learning.common.model.faculty.SubjectFaculty;
import com.Learning.common.model.student.subclass;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class facultyDao {
    final private static String mysqlURL = "jdbc:mysql://localhost:3306/Learning_Teaching";
    final private static String mysqlUsrName = "root";
    final private static String mysqlPass = "0974706833vu";

    private static final String PROCEDURE_XEM_DANH_SACH_SV = "call xem_ds_sv_dk_1_lop(?,?,?,?)";
    private static final String PROCEDURE_xem_ds_mon_hoc = "call xem_ds_mon_hoc(?)";
    private static final String PROCEDURE_UPDATE_SUBJECT_STATUS = "call UPDATE_SUBJECT_STATUS(?,?)";
    private static final String PROCEDURE_them_mon_hoc = "call them_mon_hoc(?,?,?,?,?)";
    private static final String PROCEDURE_UPDATE_LECTURER_CLASS = "call UPDATE_LECTURER_CLASS(?,?,?,?,?)";
    private static final String PRODCEDURE_LIST_SUBJECT_SEMESTER_FACULTY = "call LIST_SUBJECT_SEMESTER_FACULTY(?,?,?)";

    private static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(mysqlURL, "root", "0974706833vu");
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
    public static List<subclass> getListSubclassInSemesterFaculty(int year,int semester,String FacultyName){
        List<subclass> list = new ArrayList<>();

        Connection conn=getConnection();

        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PRODCEDURE_LIST_SUBJECT_SEMESTER_FACULTY);
            preparedStatement.setInt(1,year);
            preparedStatement.setInt(2,semester);
            preparedStatement.setString(3,FacultyName);
            //This line is for debug purpose only
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){
                subclass subclass=new subclass();
                subclass.setSubJectName(res.getString("CNAME"));
                subclass.setClassId(res.getString("SCID"));
                subclass.setSubClassId(res.getString("SID"));
                subclass.setNoCreadits(res.getInt("NoCredits"));
                subclass.setYear(res.getInt("CYear"));
                subclass.setSemester(res.getInt("SEMESTER"));
                String lecturer=res.getString("FNAME")+" "+res.getString("LNAME");

                if(!lecturer.contains("null"))
                    subclass.setLecture(lecturer);
                list.add(subclass);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }



    public static String  UpdateLecturerClass(String IdMonHoc ,String SubclaaID ,String  _year,String  _semester
                             ,String   lecturerID){
        String mess="";
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_UPDATE_LECTURER_CLASS);
            preparedStatement.setString(1, IdMonHoc);
            preparedStatement.setString(2, SubclaaID);
            preparedStatement.setString(3, _year);
            preparedStatement.setString(4, _semester);
            preparedStatement.setString(5, lecturerID);
            preparedStatement.execute();
        } catch (SQLException throwables) {
           mess= throwables.getMessage();

        }
        return mess;
    }
    public static String InserSubject(String subjectID, String subjectName, int status, int Nocredit, String FName) {
        String mess = "";
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_them_mon_hoc);
            preparedStatement.setString(1, subjectID);
            preparedStatement.setString(2, subjectName);
            preparedStatement.setString(5, FName);
            preparedStatement.setInt(3, status);
            preparedStatement.setInt(4, Nocredit);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            mess = throwables.getMessage();

        }
        return mess;
    }

    public static List<SubjectFaculty> getListSubjectFaculty(String Facultyname) {
        List<SubjectFaculty> list = new ArrayList<>();
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_ds_mon_hoc);
            preparedStatement.setString(1, Facultyname);
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                SubjectFaculty subjectFaculty = new SubjectFaculty();
                subjectFaculty.setSubjectID(res.getString("CID"));
                subjectFaculty.setSubjectName(res.getString("CName"));
                subjectFaculty.setNocredit(res.getInt("NoCredits"));
                subjectFaculty.setStatus(res.getInt("STATUS"));
                list.add(subjectFaculty);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static void Update_Subject_Status(String subjectID, int status) {
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_UPDATE_SUBJECT_STATUS);
            preparedStatement.setString(1, subjectID);
            preparedStatement.setInt(2, status);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
