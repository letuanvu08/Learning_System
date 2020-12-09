package com.Learning.common;

public enum UserType {
	STUDENT,LECTURER, AAOEMPLOYEE,UNIORLECTURER;
	
	private String string;
	
	static {
		STUDENT.string = "student";
		LECTURER.string = "lecturer";
		AAOEMPLOYEE.string = "aaoemployee";
		UNIORLECTURER.string="uniorlecturer";

	}
	
	public String toString() {
		return string;
	}
}
