package com.Learning.faculty;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.faculty.facultyDao;
import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.faculty.SubjectFaculty;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "updateSubject")
public class UpdateSubject extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        String chooseform = request.getParameter("btn-form");
        String[] listvalue=chooseform.split(" ");
        switch (listvalue[0]) {
            case "open":
                facultyDao.Update_Subject_Status(listvalue[1], 1);
                request.setAttribute("openpage", "active");

                break;
            case "close":
                facultyDao.Update_Subject_Status(listvalue[1], 0);
                request.setAttribute("lecturer_featured", "lecturer_featured");
                request.setAttribute("closepage", "active");
                break;
            case "add":

                String subjectID = request.getParameter("addsubjectID");
                String subjectNName = request.getParameter("addsubjectname");
                String mess;

                String  Nocredit = request.getParameter("addNocredits");

                String   status = request.getParameter("addstatus");
                String lectuerID=request.getParameter("addlecturerID");
                mess = facultyDao.InserSubject(subjectID, subjectNName, status, Nocredit, employee.getFacultyName(),lectuerID);
                if (status.equals("1")) {
                    request.setAttribute("closepage", "active");
                    request.setAttribute("lecturer_featured", "lecturer_featured");
                } else {
                    request.setAttribute("openpage", "active");
                }
                request.setAttribute("status", mess);
                break;
        }
        List<SubjectFaculty> list = facultyDao.getListSubjectFaculty(employee.getFacultyName());
        request.setAttribute("listsubject", list);
        RequestDispatcher req = request.getRequestDispatcher("/pages/faculty/updatesubject.jsp");
        req.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        List<SubjectFaculty> list = facultyDao.getListSubjectFaculty(employee.getFacultyName());
        request.setAttribute("listsubject", list);
        request.setAttribute("openpage", "active");
        RequestDispatcher req = request.getRequestDispatcher("/pages/faculty/updatesubject.jsp");
        req.forward(request, response);
    }
}
