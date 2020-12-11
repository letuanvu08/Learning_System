package com.Learning.common;

public enum UserType {
	STUDENT,LECTURER, AAOEMPLOYEE,UNIORLECTURER,FACULTY;
	
	private String string;
	
	static {
		STUDENT.string = "student";
		LECTURER.string = "lecturer";
		AAOEMPLOYEE.string = "aaoemployee";
		UNIORLECTURER.string="uniorlecturer";
		FACULTY.string="faculty";
	}
	
	public String toString() {
		return string;
	}
}
