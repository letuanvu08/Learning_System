package com.Learning.common.model.student;

public class Student {
    private String studentID;
    private String  status;
    private int yearofadmission;
    private String FSName;
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
}
