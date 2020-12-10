package com.Learning.common.model.student;

public class subclass {

            private String SubJectName;
            private String ClassId;
            private String SubClassId;
            private String Lecture;
            private int NoCreadits;
            private int Year;
            private int Semester;
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
}
