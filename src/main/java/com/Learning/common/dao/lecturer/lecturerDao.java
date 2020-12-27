package com.Learning.common.dao.lecturer;

import com.Learning.common.model.lecturer.Lecturer;
import com.Learning.common.model.lecturer.SubjectLecturer;
import com.Learning.common.model.lecturer.TextBook;
import com.Learning.common.model.lecturer.TopClassLecturer;
import com.Learning.common.model.student.Subject;
import com.Learning.common.model.student.subclass;

import java.sql.*;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

public class lecturerDao {

    final private static String mysqlURL = "jdbc:mysql://localhost:3306/Learning_Teaching1";
    final private static String mysqlUsrName = "root";
    final private static String mysqlPass = "0974706833vu";
//    final private static String mysqlPass="soni1382000duy";

    final private static String PROCEDURE_xem_ds_mon_hoc_textbook_pt = "call xem_ds_mon_hoc_textbook_pt(?)";
    final private static String PROCEDURE_xem_textbook_mon_hoc_pt = "call xem_textbook_mon_hoc_pt(?,?)";
    final private static String PROCEDURE_them_textbook_chinh = "call them_textbook_chinh(?,?)";
    final private static String PROCEDURE_xoa_textbook_theo_ma_mh = "call xoa_textbook_theo_ma_mh(?,?)";
    final private static String PROCEDURE_xem_ds_lop_mon_hoc_pt = "call xem_ds_lop_mon_hoc_pt(?,?)";
    final private static String PROCEDURE_xem_ds_lop_pt = "call xem_ds_lop_pt(?,?)";
    final private static String PROCEDURE_xem_ds_sv_pt = "call xem_ds_sv_pt(?,?)";
    final private static String PROCEDURE_xem_so_lop_pt_gan_day = "call xem_so_lop_pt_gan_day(?)";
    final private static String PROCEDURE_xem_top_5_lop_sv_cao_nhat_pt= "call xem_top_5_lop_sv_cao_nhat_pt(?)";
    final private static String PROCEDURE_xem_xem_top_5_hk_lop_nhieu_nhat_pt= "call xem_top_5_hk_lop_nhieu_nhat_pt(?)";

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

    public static int checkContain(List<SubjectLecturer> list, String CID) {
        for (SubjectLecturer subject : list) {
            if (subject.getSubjectID().equals(CID)) return list.indexOf(subject);
        }
        return -1;
    }

    public static String AddTextbookSubject(String ISBN, String subjectID) {
        String mess = "";
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_them_textbook_chinh);
            preparedStatement.setString(1, subjectID);
            preparedStatement.setString(2, ISBN);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            mess = throwables.getMessage();
        }
        return mess;
    }

    public static String RemoveTextbookSubject(String ISBN, String subjectID) {
        String mess = "";
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xoa_textbook_theo_ma_mh);
            preparedStatement.setString(1, subjectID);
            preparedStatement.setString(2, ISBN);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            mess = throwables.getMessage();
        }
        return mess;
    }


    public static List<SubjectLecturer> getListSubjectChargeLecturer(String lecturerID) {
        List<SubjectLecturer> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_ds_mon_hoc_textbook_pt);
            preparedStatement.setString(1, lecturerID);
            ;
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                String CID = res.getString("CID");
                String TName = res.getString("TName");
                String ISBN = res.getString("ISBN");
                TextBook textBook = new TextBook();
                textBook.setTextBookName(TName);
                textBook.setISBN(ISBN);
                System.out.println(CID);
                int index = checkContain(list, CID);
                if (index != -1)
                    list.get(index).addTexBook(textBook);
                else {
                    SubjectLecturer subject = new SubjectLecturer();
                    subject.setSubjectID(res.getString("CID"));
                    subject.setSubjectName(res.getString("CName"));
                    subject.setNoCreadits(res.getInt("NoCredits"));
                    List<TextBook> listtexbook = new ArrayList<>();
                    listtexbook.add(textBook);
                    subject.setListTexbook(listtexbook);
                    list.add(subject);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static List<List<Integer>> getTopFiveSemesterOfLecturer(String lecturerID) {
        List<List<Integer>> list=new ArrayList<>();
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_xem_top_5_hk_lop_nhieu_nhat_pt);
            preparedStatement.setString(1, lecturerID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                List<Integer> element=new ArrayList<>();
                element.add(res.getInt("CYEAR"));
                element.add(res.getInt("CSEMESTER"));
                element.add(res.getInt("CLASS_NUMBER"));
                list.add(element);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static List<List<Integer>> getThreeSemesternearly(String lecturerID) {
       List<List<Integer>> list=new ArrayList<>();
        Connection conn = getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_so_lop_pt_gan_day);
            preparedStatement.setString(1, lecturerID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                List<Integer> element=new ArrayList<>();
                element.add(res.getInt("CYEAR"));
                element.add(res.getInt("CUR_SEMESTER"));
                element.add(res.getInt("CLASS_NUM"));
                list.add(element);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static SubjectLecturer getSubjectChargeLecturer(String lecturerID, String subjectID) {
        SubjectLecturer subjectLecturer = new SubjectLecturer();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_textbook_mon_hoc_pt);
            preparedStatement.setString(1, lecturerID);
            preparedStatement.setString(2, subjectID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                subjectLecturer.setSubjectID(res.getString("CID"));
                subjectLecturer.setSubjectName(res.getString("CName"));
                String TName = res.getString("TName");
                String ISBN = res.getString("ISBN");
                TextBook textBook = new TextBook();
                textBook.setTextBookName(TName);
                textBook.setISBN(ISBN);
                List<TextBook> listtexbook = new ArrayList<>();
                if (ISBN != null)
                    listtexbook.add(textBook);
                subjectLecturer.setListTexbook(listtexbook);
                break;
            }
            while (res.next()) {
                String TName = res.getString("TName");
                String ISBN = res.getString("ISBN");
                TextBook book = new TextBook();
                book.setTextBookName(TName);
                book.setISBN(ISBN);
                if (ISBN != null)
                    subjectLecturer.addTexBook(book);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return subjectLecturer;
    }

    public static List<TopClassLecturer> getTop5SubclassOfLectuer(String lectuerID) {
        List<TopClassLecturer> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_top_5_lop_sv_cao_nhat_pt);
            preparedStatement.setString(1, lectuerID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                TopClassLecturer subclass = new TopClassLecturer();
                subclass.setSubJectName(res.getString("CNAME"));
                subclass.setClassId(res.getString("CID"));
                subclass.setSubClassId(res.getString("SID"));
                subclass.setSemester(res.getInt("CSEMESTER"));
                subclass.setYear(res.getInt("CYEAR"));
                subclass.setNumberStudent(res.getInt("STUDENT_NUMBER"));
                list.add(subclass);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }









    public static List<subclass> getListSubclassOfLectuer(String semester, String lectuerID) {
        List<subclass> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_ds_lop_pt);
            preparedStatement.setString(1, semester);
            preparedStatement.setString(2, lectuerID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                subclass subclass = new subclass();
                subclass.setSubJectName(res.getString("CNAME"));
                subclass.setClassId(res.getString("CID"));
                subclass.setSubClassId(res.getString("SID"));
                subclass.setSemester(res.getInt("CSEMESTER"));
                subclass.setYear(res.getInt("CYEAR"));
                String lecturer = res.getString("FNAME") + " " + res.getString("LNAME");
                if (!lecturer.contains("null"))
                    subclass.setLecture(lecturer);
                list.add(subclass);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    public static List<subclass> getListSubclassOfSujectLectuer(String semester, String lectuerID) {
        List<subclass> list = new ArrayList<>();

        Connection conn = getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(PROCEDURE_xem_ds_lop_mon_hoc_pt);
            preparedStatement.setString(1, semester);
            preparedStatement.setString(2, lectuerID);
            //This line is for debug purpose only
            ResultSet res = preparedStatement.executeQuery();
            while (res.next()) {
                subclass subclass = new subclass();
                subclass.setSubJectName(res.getString("CNAME"));
                subclass.setClassId(res.getString("CID"));
                subclass.setSubClassId(res.getString("SID"));
                subclass.setSemester(res.getInt("CSEMESTER"));
                subclass.setYear(res.getInt("CYEAR"));
                String lecturer = res.getString("FNAME") + " " + res.getString("LNAME");
                if (!lecturer.contains("null"))
                    subclass.setLecture(lecturer);
                list.add(subclass);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }


}
