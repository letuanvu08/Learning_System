package com.Learning.common.model.faculty;

public class Employee {
    private String id;
    private String FacultyName;
    public Employee(){}
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFacultyName() {
        return FacultyName;
    }

    public void setFacultyName(String facultyName) {
        FacultyName = facultyName;
    }
}
