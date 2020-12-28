package com.Learning.common.dao.faculty;

import com.Learning.common.model.faculty.SubjectFaculty;
import com.Learning.common.model.lecturer.Lecturer;
import com.Learning.common.model.student.Student;
import com.Learning.common.model.student.Subject;
import com.Learning.common.model.student.subclass;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class facultyDao {
    final private static String mysqlURL = "jdbc:mysql://localhost:3306/Learning_Teaching";
    final private static String mysqlUsrName = "faculty";
    final private static String mysqlPass = "faculty";

    private static final String PROCEDURE_XEM_DANH_SACH_SV = "call xem_ds_sv_dk_1_lop(?,?,?,?)";//
    private static final String PROCEDURE_xem_ds_mon_hoc = "call xem_ds_mon_hoc(?)";//
    private static final String PROCEDURE_UPDATE_SUBJECT_STATUS = "call UPDATE_SUBJECT_STATUS(?,?)";//
    private static final String PROCEDURE_them_mon_hoc = "call them_mon_hoc(?,?,?,?,?,?)";//
    private static final String PROCEDURE_UPDATE_LECTURER_CLASS = "call UPDATE_LECTURER_CLASS(?,?,?,?,?)";//
    private static final String PRODCEDURE_LIST_SUBCLASS_SEMESTER_FACULTY = "call LIST_SUBCLASS_SEMESTER_FACULTY(?,?,?)";//
    private static final String PRODCEDURE_LIST_CLASS_OF_LECTURER_SEMESTER_FACULTY = "call LIST_CLASS_OF_LECTURER_SEMESTER_FACULTY(?,?,?,?)";//
    private static final String PRODCEDURE_xem_ds_sv_dk_1_lop = "call xem_ds_sv_dk_1_lop(?,?,?,?)";//
    private static final String PRODCEDURE_xem_ds_giang_vien = "call xem_ds_giang_vien(?)";//
    private static final String PRODCEDURE_xem_giao_trinh_mon_hoc_khoa = "call xem_giao_trinh_mon_hoc_khoa(?)";//
    private static final String PRODCEDURE_them_gv_phu_trach = "call them_gv_phu_trach(?,?,?,?,?,?)";//
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

    public static int checkContain(List<Subject> list, String CID) {
        for (Subject subject : list) {
            if (subject.getSubjectID().equals(CID)) return list.indexOf(subject);
        }
        return -1;
    }

    private static int checkContainLecturer(List<subclass> list, String subjectID, String CID) {
        for (subclass subclass : list) {
            if (subclass.getSubClassId().equals(CID) && subclass.getClassId().equals(subjectID))
                return list.indexOf(subclass);
        }
        return -1;
    }

    public static List<Subject> getListSubjectAndTextBookFaculty(String SubjectID) {
        List<Subject> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PRODCEDURE_xem_giao_trinh_mon_hoc_khoa);
            preparedStatement.setString(1, SubjectID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                String CID = res.getString("CID");
                String TName = res.getString("TName");
                int index = checkContain(list, CID);
                if (index != -1)
                    list.get(index).addTexBook(TName);
                else {
                    Subject subject = new Subject();
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

    public static List<Lecturer> getListLecturerFaculty(String facultyName) {
        List<Lecturer> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PRODCEDURE_xem_ds_giang_vien);
            preparedStatement.setString(1, facultyName);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                Lecturer lecturer = new Lecturer();
                lecturer.setName(res.getString("LNAME") + " " + res.getString("FNAME"));
                lecturer.setLecturerID(res.getString("LID"));
                lecturer.setEmail(res.getString("EMAIL"));
                lecturer.setFacultyName(res.getString("FEName"));
                list.add(lecturer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }




    public static List<Student> getListStudentFaculty(String year, String semester, String ClassID, String subclassID) {
        List<Student> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PRODCEDURE_xem_ds_sv_dk_1_lop);
            preparedStatement.setString(1, year);
            preparedStatement.setString(2, semester);
            preparedStatement.setString(3, ClassID);
            preparedStatement.setString(4, subclassID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                Student student = new Student();
                student.setStudentID(res.getString("StudentID"));
                student.setFSName(res.getString("FSName"));
                student.setEmail(res.getString("EMAIL"));
                student.setName(res.getString("FNAME") + " " + res.getString("LNAME"));
                list.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


    public static List<subclass> getListClassOfLecturerFaculty(String year, String semester, String FacultyName, String lecturerID) {
        List<subclass> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PRODCEDURE_LIST_CLASS_OF_LECTURER_SEMESTER_FACULTY);
            preparedStatement.setString(1, year);
            preparedStatement.setString(2, semester);
            preparedStatement.setString(3, FacultyName);
            preparedStatement.setString(4, lecturerID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
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
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }


    public static List<subclass> getListSubclassInSemesterFaculty(int year, int semester, String FacultyName) {
        List<subclass> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PRODCEDURE_LIST_SUBCLASS_SEMESTER_FACULTY);
            preparedStatement.setInt(1, year);
            preparedStatement.setInt(2, semester);
            preparedStatement.setString(3, FacultyName);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
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
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    public static String UpdateLecturerWeekClass(String IdMonHoc, String SubclaaID, String _year, String _semester,String number
            , String lecturerID) {
        String mess = "";
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PRODCEDURE_them_gv_phu_trach);
            preparedStatement.setString(1, IdMonHoc);
            preparedStatement.setString(2, SubclaaID);
            preparedStatement.setString(3, _year);
            preparedStatement.setString(4, _semester);
            preparedStatement.setString(5, number);
            preparedStatement.setString(6, lecturerID);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            mess = throwables.getMessage();

        }
        return mess;
    }




    public static String UpdateLecturerClass(String IdMonHoc, String SubclaaID, String _year, String _semester
            , String lecturerID) {
        String mess = "";
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
            mess = throwables.getMessage();

        }
        return mess;
    }

    public static String InserSubject(String subjectID, String subjectName, String  status, String  Nocredit, String FName,String lectuerID) {
        String mess = "";
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_them_mon_hoc);
            preparedStatement.setString(1, subjectID);
            preparedStatement.setString(2, subjectName);
            preparedStatement.setString(5, FName);
            preparedStatement.setString(3, status);
            preparedStatement.setString(4, Nocredit);
            preparedStatement.setString(6, lectuerID);
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
