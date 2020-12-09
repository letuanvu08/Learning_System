package com.Learning.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.Learning.common.dao.student.studentDao;
import com.Learning.common.model.student.subclass;
@WebServlet(name = "/attend")
public class Attend extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<subclass> list=studentDao.getListSubject(201);
        request.setAttribute("listSubclass",list);
        RequestDispatcher req=request.getRequestDispatcher("/pages/student/attend.jsp");
        req.forward(request,response);

    }
}
