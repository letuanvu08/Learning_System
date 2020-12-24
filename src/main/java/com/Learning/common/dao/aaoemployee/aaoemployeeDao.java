package com.Learning.common.dao.aaoemployee;

import com.Learning.common.model.lecturer.Lecturer;
import com.Learning.common.model.student.*;
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
    private static final String PROCEDURE_THEM_LOP="call them_lop(?,?,?,?)";
    private static final String PROCEDURE_XOA_LOP="call xoa_lop(?,?,?,?)";
    private static final String PROCEDURE_cap_nhat_lop="call cap_nhat_lop(?,?,?,?,?,?,?,?)";
    private static final String PROCEDURE_xem_ds_lop_cua_1_sv="call xem_ds_lop_cua_1_sv(?,?,?)";
    private static final String PROCEDURE_xem_ds_lop_cua_1_gv="call xem_ds_lop_cua_1_gv(?,?)";
    private static final String PROCEDURE_xem_tong_mon_hoc="call xem_tong_mon_hoc(?)";
    private static final String PROCEDURE_xem_tong_lop ="call xem_tong_lop(?)";
    private static final String PROCEDURE_xem_tong_sv_dk ="call xem_tong_sv_dk (?)";

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
    public static List<Facultydetail> getDetailFaculty(int semeter){
        List<Facultydetail> list =getSumSubject(semeter);
        for (Facultydetail faculty:getSumClass(semeter)
             ) {

            boolean flag=false;
            for (Facultydetail i :list
                 ) {
                if(faculty.getFacultyName().equals(i.getFacultyName())){


                    list.get(list.indexOf(i)).setSumClass(faculty.getSumClass());

                flag=true;
                }
            }
            if(!flag){
                list.add(faculty);
            }
        }
        for (Facultydetail faculty:getSumStudentAttend(semeter)
        ) {
            boolean flag=false;

            for (Facultydetail i :list
            ) {
                if(faculty.getFacultyName().equals(i.getFacultyName())){
                    list.get(list.indexOf(i)).setSumSutdentAttend(faculty.getSumSutdentAttend());
                    flag=true;
                }
            }
            if(!flag){
                list.add(faculty);
            }
        }
        return list;
    }
    private static List<Facultydetail> getSumSubject(int semester){
        Connection conn=getConnection();
        List<Facultydetail> list=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_xem_tong_mon_hoc);
            preparedStatement.setInt(1,semester);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()){
                Facultydetail facultydetail=new Facultydetail();
                facultydetail.setFacultyName(res.getString("FName"));
                facultydetail.setSumSubject(res.getInt("sum"));
                list.add(facultydetail);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    private static List<Facultydetail> getSumClass(int semester){
        Connection conn=getConnection();
        List<Facultydetail> list=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_xem_tong_lop);
            preparedStatement.setInt(1,semester);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()){
                Facultydetail facultydetail=new Facultydetail();
                facultydetail.setFacultyName(res.getString("FName"));
                facultydetail.setSumClass(res.getInt("sum"));

                list.add(facultydetail);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    private static List<Facultydetail> getSumStudentAttend(int semester){
        Connection conn=getConnection();
        List<Facultydetail> list=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_xem_tong_sv_dk);
            preparedStatement.setInt(1,semester);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()){
                Facultydetail facultydetail=new Facultydetail();
                facultydetail.setFacultyName(res.getString("FName"));
                facultydetail.setSumSutdentAttend(res.getInt("NO_StudentS"));
                list.add(facultydetail);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }








    public static List<subclass> getlistclassofStudent(String studentid,int year,int semester){
        Connection conn=getConnection();
        List<subclass> list=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_xem_ds_lop_cua_1_sv);
            preparedStatement.setString(1,studentid);
            preparedStatement.setInt(2,year);
            preparedStatement.setInt(3,semester);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()){
                subclass subclass =new subclass();
                subclass.setSubJectName(res.getString("CNAME"));
                subclass.setClassId(res.getString("SCID"));
                subclass.setSubClassId(res.getString("SID"));
                subclass.setLecture(res.getString("Fname")+" "+res.getString("LNAME"));
                list.add(subclass);
            }
        } catch (SQLException throwables) {
           throwables.printStackTrace();
        }
        return list;
    }
    public static List<subclass> getlistclassofLecturer(String lecturertid,int semester){
        Connection conn=getConnection();
        List<subclass> list=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_xem_ds_lop_cua_1_gv);
            preparedStatement.setString(1,lecturertid);
            preparedStatement.setInt(2,semester);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()){
                subclass subclass =new subclass();
                subclass.setSubJectName(res.getString("CNAME"));
                subclass.setClassId(res.getString("SCID"));
                subclass.setSubClassId(res.getString("SID"));
                list.add(subclass);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    public static String  addClass(String SubjectID, int year, int semester, String subclassID){
        Connection conn=getConnection();
        String mess="";
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_THEM_LOP);
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
    public static String  updateClass(String SubjectID, int year, int semester, String subclassID,String newSubjectID, int newyear, int newsemester, String newsubclassID){
        Connection conn=getConnection();
        String mess="";
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROCEDURE_cap_nhat_lop);
            preparedStatement.setString(1,SubjectID);
            preparedStatement.setInt(2,year);
            preparedStatement.setInt(3,semester);
            preparedStatement.setString(4,subclassID);
            preparedStatement.setString(5,newSubjectID);
            preparedStatement.setInt(6,newyear);
            preparedStatement.setInt(7,newsemester);
            preparedStatement.setString(8,newsubclassID);
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
