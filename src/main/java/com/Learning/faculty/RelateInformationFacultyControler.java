package com.Learning.faculty;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.model.faculty.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RelateInformationFaculty")
public class RelateInformationFacultyControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);



        RequestDispatcher req=request.getRequestDispatcher("/pages/faculty/relateinformationfaculty.jsp");
        req.forward(request,response);
    }
}
