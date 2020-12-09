package com.Learning.common.dao.student;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import com.Learning.common.model.student.subclass;
import com.Learning.common.model.student.Student;

public class studentDao {
    final private static String mysqlURL="jdbc:mysql://localhost:3306/Learning_Teaching";
    final private static String mysqlUsrName="root";
    final private static String mysqlPass="0974706833vu";

    private static final String PRODCEDURE_LIST_SUBJECT_SEMESTER ="Call LIST_SUBJECT_SEMESTER(?)";

    private static final String PROFILE ="Select SemesterStatus status,StudentID,FSName,YearofAdmission from Student join Status S on Student.StudentID = S.SSID where PersonalSID=? and SemesterStatus = (select max(SemesterStatus) from Status where Status.SSID=Student.StudentID)";
    private static Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(mysqlURL,"root","0974706833vu");
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
    public static Student getProfile(String  personalID){
      Student student=null;

        Connection conn=getConnection();

        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PROFILE);
            preparedStatement.setString(1,personalID);
            //This line is for debug purpose only
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){
                student =new Student();
                student.setStudentID(res.getString("StudentID"));
                student.setYearofadmission(res.getInt("YearofAdmission"));

                student.setFSName(res.getString("FSName"));
                int status= res.getInt("status");
                if (status==0){
                    student.setStatus("Đang học");
                }
                else if(status==1)
                    student.setStatus("Tạm dừng");
                else student.setStatus("Buộc thôi học");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
       return student;
    }

    public static List<subclass> getListSubject(int semester){
        List<subclass> list = new ArrayList<>();

        Connection conn=getConnection();

        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PRODCEDURE_LIST_SUBJECT_SEMESTER);
            preparedStatement.setLong(1,semester);
        	//This line is for debug purpose only
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){

                subclass subclass=new subclass();
                subclass.setSubJectName(res.getString("CNAME"));
                subclass.setClassId(res.getString("SID"));
                subclass.setSubClassId(res.getString("SCID"));
                subclass.setLecture(res.getString("LNAME"));
                list.add(subclass);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    return list;
    }


}
