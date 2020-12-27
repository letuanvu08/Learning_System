package com.Learning.common.model.lecturer;

public class TextBook {
    private String TextBookName;
    private String ISBN;
    public TextBook(){}

    public String getTextBookName() {
        return TextBookName;
    }

    public void setTextBookName(String textBookName) {
        TextBookName = textBookName;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }
}
