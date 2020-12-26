package com.Learning.common.model.student;

import com.Learning.common.model.lecturer.Lecturer;

import java.util.List;

public class subclass {

            private String SubJectName;
            private String ClassId;
            private String SubClassId;
            private String Lecture;
            private String LecturerId;
            private int NoCreadits;
            private int Year;
            private int Semester;
            private List<Lecturer> listlectuer;
    public subclass(){};
    public subclass(String SubJectName,String ClassId,String SubClassId,String Lecture){
            this.SubJectName=SubJectName;
            this.ClassId=ClassId;
            this.SubClassId=SubClassId;
            this.Lecture=Lecture;

    }
    public String getSubJectName() {
        return SubJectName;
    }

    public void setSubJectName(String subJectName) {
        SubJectName = subJectName;
    }

    public String getClassId() {
        return ClassId;
    }

    public void setClassId(String classId) {
        ClassId = classId;
    }

    public String getSubClassId() {
        return SubClassId;
    }

    public void setSubClassId(String subClassId) {
        SubClassId = subClassId;
    }

    public String getLecture() {
        return Lecture;
    }

    public void setLecture(String lecture) {
        Lecture = lecture;
    }

    public int getNoCreadits() {
        return NoCreadits;
    }

    public void setNoCreadits(int noCreadits) {
        NoCreadits = noCreadits;
    }

    public int getSemester() {
        return Semester;
    }

    public void setSemester(int semester) {
        Semester = semester;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int year) {
        Year = year;
    }

    public String getLecturerId() {
        return LecturerId;
    }

    public void setLecturerId(String lecturerId) {
        LecturerId = lecturerId;
    }

    public List<Lecturer> getListlectuer() {
        return listlectuer;
    }

    public void setListlectuer(List<Lecturer> listlectuer) {
        this.listlectuer = listlectuer;
    }
    public void addlecturer(Lecturer lecturer){
        this.listlectuer.add(lecturer);
    }
}
