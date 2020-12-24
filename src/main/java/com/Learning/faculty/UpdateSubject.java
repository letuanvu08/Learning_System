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
        System.out.println(chooseform);
        switch (chooseform) {
            case "open":
                String valueopen = request.getParameter("valueopen");
                facultyDao.Update_Subject_Status(valueopen, 1);
                request.setAttribute("openpage", "active");
                break;
            case "close":
                String valueclose = request.getParameter("valueclose");
                facultyDao.Update_Subject_Status(valueclose, 0);
                request.setAttribute("lecturer_featured", "lecturer_featured");
                request.setAttribute("closepage", "active");
                break;
            case "add":

                String subjectID = request.getParameter("addsubjectID");
                String subjectNName = request.getParameter("addsubjectname");
                String mess;

                int Nocredit = Integer.parseInt(request.getParameter("addNocredits"));

                int status = Integer.parseInt(request.getParameter("addstatus"));
                mess = facultyDao.InserSubject(subjectID, subjectNName, status, Nocredit, employee.getFacultyName());
                if (status == 1) {
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
