package com.Learning.common.model.faculty;

public class SubjectFaculty {
    private String subjectID;
    private String subjectName;
    private int Nocredit;
    private int status;
    public SubjectFaculty(){}
    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getNocredit() {
        return Nocredit;
    }

    public void setNocredit(int nocredit) {
        Nocredit = nocredit;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
