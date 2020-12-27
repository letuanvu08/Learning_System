package com.Learning.lecturer;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.lecturer.lecturerDao;
import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.lecturer.TopClassLecturer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "relatedinformation")
public class relatedinformationControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String userID=(String) session.getAttribute("userID");
        Employee employee= UserDao.getEmployeeByID(userID);
        List<List<Integer>> listThreenearly= lecturerDao.getThreeSemesternearly(employee.getId());
        List<List<Integer>> listFiveSemestermostlytClass=lecturerDao.getTopFiveSemesterOfLecturer(employee.getId());
        List<TopClassLecturer> listTopFiveClass=lecturerDao.getTop5SubclassOfLectuer(employee.getId());
        request.setAttribute("listThreenearly",listThreenearly);
        request.setAttribute("listFiveSemestermostlytClass",listFiveSemestermostlytClass);
        request.setAttribute("listTopFiveClass",listTopFiveClass);
        RequestDispatcher req=request.getRequestDispatcher("/pages/lecturer/relatedinformation.jsp");
        req.forward(request,response);
    }
}
