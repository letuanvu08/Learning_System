package com.Learning.faculty;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.faculty.facultyDao;
import com.Learning.common.dao.aaoemployee.aaoemployeeDao;
import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.faculty.SubjectFaculty;
import com.Learning.common.model.student.Student;
import com.Learning.common.model.student.subclass;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "classFacultyControler")
public class classFacultyControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("memberid");
        String  yearfind = request.getParameter("year");
        String  semesterfind = request.getParameter("semester");
        String choose = request.getParameter("btn-form");
        List<subclass> list;
        RequestDispatcher req;
        switch (choose) {
            case "find":
                HttpSession session = request.getSession();
                String userID = (String) session.getAttribute("userID");
                Employee employee = UserDao.getEmployeeByID(userID);
                list=facultyDao.getListClassOfLecturerFaculty(yearfind,semesterfind,employee.getFacultyName(),ID);
                request.setAttribute("listclasslecturer",list);
                request.setAttribute("lecturer_featured", "lecturer_featured");
                request.setAttribute("listlecturer", "active");
                System.out.println(list.size());
                List<subclass> listget = facultyDao.getListSubclassInSemesterFaculty(year,semester,employee.getFacultyName());
                request.setAttribute("listSubclass", listget);
                 req= request.getRequestDispatcher("/pages/faculty/classfaculty.jsp");
                req.forward(request, response);
                break;
            case "detail":
                String valuedetail=request.getParameter("valuedetail");
                String[] listvalues=valuedetail.split(" ");
                List<Student> liststudent=facultyDao.getListStudentFaculty(listvalues[0],listvalues[1],listvalues[2],listvalues[3]);
                request.setAttribute("liststudent",liststudent);
                req = request.getRequestDispatcher("/pages/faculty/lisstudentClassFaculty.jsp");
                req.forward(request, response);
                break;
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        List<subclass> listget = facultyDao.getListSubclassInSemesterFaculty(year,semester,employee.getFacultyName());
        request.setAttribute("listSubclass", listget);
        request.setAttribute("listall", "active");
        RequestDispatcher req = request.getRequestDispatcher("/pages/faculty/classfaculty.jsp");
        req.forward(request, response);
    }
    private static int semester=201;
    private static int year=2020;

}
