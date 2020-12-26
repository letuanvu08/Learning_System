package com.Learning.faculty;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.faculty.facultyDao;
import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.lecturer.Lecturer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listlecturerfaculty")
public class listlecturerfacultyControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        List<Lecturer> list= facultyDao.getListLecturerFaculty(employee.getFacultyName());
        request.setAttribute("listlecturer",list);
        RequestDispatcher req = request.getRequestDispatcher("/pages/faculty/listlecturerfaculty.jsp");
        req.forward(request, response);
    }
}
