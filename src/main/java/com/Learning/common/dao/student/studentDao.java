package com.Learning.common.dao.student;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import com.Learning.common.model.lecturer.Lecturer;
import com.Learning.common.model.student.*;

public class studentDao {
    final private static String mysqlURL="jdbc:mysql://localhost:3306/Learning_Teaching1";
    final private static String mysqlUsrName="root";
    final private static String mysqlPass="0974706833vu";

    private static final String PRODCEDURE_LIST_SUBJECT_SEMESTER ="Call LIST_SUBJECT_SEMESTER(?)";
    private static final String PRODCEDURE_LIST_SUBJECT_ATTEND ="Call LIST_SUBJECT_ATTEND(?,?)";
    private static final String PRODCEDURE_LIST_SUBCLASS_ATTEND ="Call LIST_SUBCLASS_ATTEND(?,?)";
    private static final String PRODCEDURE_SUM_No_Registered_Credits_ALL_SEMESTER ="Call SUM_No_Registered_Credits_ALL_SEMESTER(?)";
    private static final String PRODCEDURE_DANGKY="Call DANGKY(?,?,?,?,?)";
    private static final String PROFILE ="call GET_STUDENT(?)";
    private static final String DELETE_ATTEND ="delete from Attend where  AYear=? AND ASemester=? and ACID=? and ASID=?  AND AStudentID=?";
    private static Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(mysqlURL,mysqlUsrName,mysqlPass);
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
    public static String DeleteAttend(Student student,String subclassId,String classID,int year){
        Connection conn=getConnection();
        String  check="";
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(DELETE_ATTEND);
            preparedStatement.setInt(1,year);
            preparedStatement.setInt(2,student.getSemester());
            preparedStatement.setString(3,classID);
            preparedStatement.setString(4,subclassId);
            preparedStatement.setString(5,student.getStudentID());
            //This line is for debug purpose only
            preparedStatement.execute();

        } catch (SQLException throwables) {
            check= throwables.getMessage();
        }
        return check;
    }
    public static String  attend(Student student,String subclassId,String classID,int year){
        Connection conn=getConnection();
        String  check="";
        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PRODCEDURE_DANGKY);
            preparedStatement.setInt(1,year);
            preparedStatement.setInt(2,student.getSemester());
            preparedStatement.setString(3,classID);
            preparedStatement.setString(4,subclassId);
            preparedStatement.setString(5,student.getStudentID());
            //This line is for debug purpose only
            preparedStatement.execute();

        } catch (SQLException throwables) {
            check= throwables.getMessage();
        }
        return check;
    }

    public static List<NoCredit> getAllNoCreditSemester(String  studentID){
        List<NoCredit> list=new ArrayList<>();
        Connection conn=getConnection();
        try{
            PreparedStatement preparedStatement=conn.prepareStatement(PRODCEDURE_SUM_No_Registered_Credits_ALL_SEMESTER);
            preparedStatement.setString(1,studentID);
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){
                NoCredit noCredit=new NoCredit();
                noCredit.setSemester(res.getInt("ASemester"));
                noCredit.setNocredit(res.getInt("NoCredit"));
                list.add(noCredit);
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
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
                student.setSemester(res.getInt("semester"));
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
    public static int checkContain(List<Subject> list, String CID){
        for (Subject subject :list) {
            if(subject.getSubjectID().equals(CID))return list.indexOf(subject);
        }
        return -1;
    }
    public static List<Subject> getListSubjectAttend(String studentID, int semester){
        List<Subject> list = new ArrayList<>();

        Connection conn=getConnection();

        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PRODCEDURE_LIST_SUBJECT_ATTEND);
            preparedStatement.setString(1,studentID);
            preparedStatement.setInt(2,semester);
        	//This line is for debug purpose only
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){
                String CID=res.getString("CID");
                String TName=res.getString("TName");
                int index= checkContain(list,CID);
                if(index!=-1)
                    list.get(index).addTexBook(TName);
                else {
                Subject subject =new Subject();
                subject.setSubjectID(res.getString("CID"));
                subject.setSubjectName(res.getString("CName"));
                subject.setNoCreadits(res.getInt("NoCredits"));
                subject.addTexBook(TName);
                list.add(subject);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    return list;
    }
    public static List<subclass> getListSubclassInSemester(int semester){
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
                subclass.setClassId(res.getString("SCID"));
                subclass.setSubClassId(res.getString("SID"));
                subclass.setNoCreadits(res.getInt("NoCredits"));
                subclass.setYear(res.getInt("CYear"));
                subclass.setSemester(res.getInt("CSemester"));
                list.add(subclass);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    private static int checkContainLecturer(List<subclass> list, String subjectID, String CID) {
        for (subclass subclass : list) {
            if (subclass.getSubClassId().equals(CID) && subclass.getClassId().equals(subjectID))
                return list.indexOf(subclass);
        }
        return -1;
    }
    public static List<subclass> getListSubclassAttended(String studentID,int semester){
        List<subclass> list = new ArrayList<>();

        Connection conn=getConnection();

        try {
            PreparedStatement preparedStatement=conn.prepareStatement(PRODCEDURE_LIST_SUBCLASS_ATTEND);
            preparedStatement.setString(1,studentID);
            preparedStatement.setLong(2,semester);
            //This line is for debug purpose only
            ResultSet res=preparedStatement.executeQuery();
            while (res.next()){
                while (res.next()) {
                    subclass subclass = new subclass();
                    subclass.setSubJectName(res.getString("CNAME"));
                    subclass.setClassId(res.getString("CID"));
                    subclass.setSubClassId(res.getString("SID"));
                    subclass.setNoCreadits(res.getInt("NoCredits"));
                    subclass.setYear(res.getInt("CYear"));
                    subclass.setSemester(res.getInt("CSEMESTER"));
                    String lecturer = res.getString("FNAME") + " " + res.getString("LNAME");
                    Lecturer Wlecturer = new Lecturer();
                    Wlecturer.setName(res.getString("WLFNAME") + " " + res.getString("WLLNAME"));
                    if (Wlecturer.getName().contains("null"))
                        Wlecturer.setName("");
                    if (!lecturer.contains("null"))
                        subclass.setLecture(lecturer);
                    int check = checkContainLecturer(list, subclass.getClassId(), subclass.getSubClassId());
                    if (check == -1) {
                        List<Lecturer> lecturerList = new ArrayList<>();
                        lecturerList.add(Wlecturer);
                        subclass.setListlectuer(lecturerList);
                        list.add(subclass);
                    } else {
                        list.get(check).addlecturer(Wlecturer);
                    }
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }


}
