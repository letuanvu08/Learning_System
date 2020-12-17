package com.Learning.common.model.aaoemployee;

public class Facultydetail {
    private int sumSubject;
    private int SumClass;
    private int SumSutdentAttend;
    private String FacultyName;
    public Facultydetail(){}
    public String getFacultyName() {
        return FacultyName;
    }

    public void setFacultyName(String facultyName) {
        FacultyName = facultyName;
    }

    public int getSumSutdentAttend() {
        return SumSutdentAttend;
    }

    public void setSumSutdentAttend(int sumSutdentAttend) {
        SumSutdentAttend = sumSutdentAttend;
    }

    public int getSumClass() {
        return SumClass;
    }

    public void setSumClass(int sumClass) {
        SumClass = sumClass;
    }

    public int getSumSubject() {
        return sumSubject;
    }

    public void setSumSubject(int sumSubject) {
        this.sumSubject = sumSubject;
    }
}
