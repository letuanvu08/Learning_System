package com.Learning.common.model.aaoemployee;

import com.Learning.common.model.lecturer.Lecturer;
import com.Learning.common.model.student.Student;

import java.util.List;

public class SubclassDetail {
        private List<Student> liststudent;
        private List<Lecturer> listlecturer;

    public List<Student> getListstudent() {
        return liststudent;
    }

    public void setListstudent(List<Student> liststudent) {
        this.liststudent = liststudent;
    }

    public List<Lecturer> getListlecturer() {
        return listlecturer;
    }

    public void setListlecturer(List<Lecturer> listlecturer) {
        this.listlecturer = listlecturer;
    }
}
