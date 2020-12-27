package com.Learning.common.model.student;

import java.util.ArrayList;
import java.util.List;

public class Subject {
    private String  SubjectID;
    private String SubjectName;
    private int NoCreadits;
    private List<String > listTexbook;

    public Subject(){listTexbook=new ArrayList<>();
    }
    public void addTexBook(String Book){
        listTexbook.add(Book);
    }
    public List<String> getListTexbook() {
        return listTexbook;
    }

    public void setListTexbook(List<String> listTexbook) {
        this.listTexbook = listTexbook;
    }

    public int getNoCreadits() {
        return NoCreadits;
    }

    public void setNoCreadits(int noCreadits) {
        NoCreadits = noCreadits;
    }

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String subjectName) {
        SubjectName = subjectName;
    }

    public String getSubjectID() {
        return SubjectID;
    }

    public void setSubjectID(String subjectID) {
        SubjectID = subjectID;
    }
}
