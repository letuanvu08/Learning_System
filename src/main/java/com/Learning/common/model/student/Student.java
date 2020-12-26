package com.Learning.common.model.student;

public class Student {
    private String studentID;
    private String Name;
    private String  status;
    private int yearofadmission;
    private String FSName;
    private int Semester;
    private String email;
    public Student(){}

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String  getStatus() {
        return status;
    }

    public void setStatus(String  status) {
        this.status = status;
    }

    public int getYearofadmission() {
        return yearofadmission;
    }

    public void setYearofadmission(int yearofadmission) {
        this.yearofadmission = yearofadmission;
    }

    public String getFSName() {
        return FSName;
    }

    public void setFSName(String FSName) {
        this.FSName = FSName;
    }

    public int getSemester() {
        return Semester;
    }

    public void setSemester(int semester) {
        Semester = semester;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
