package com.Learning.common.model.lecturer;

import java.util.ArrayList;
import java.util.List;

public class SubjectLecturer {
    private String  SubjectID;
    private String SubjectName;
    private int NoCreadits;
    private List<TextBook > listTexbook;

    public SubjectLecturer(){listTexbook=new ArrayList<>();
    }
    public void addTexBook(TextBook Book){
        listTexbook.add(Book);
    }
    public List<TextBook> getListTexbook() {
        return listTexbook;
    }

    public void setListTexbook(List<TextBook> listTexbook) {
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
