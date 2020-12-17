package com.Learning.aaoemployee;

import com.Learning.common.dao.aaoemployee.aaoemployeeDao;
import com.Learning.common.model.aaoemployee.Facultydetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "detailfaculty")
public class detailfacultyController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Facultydetail> list = aaoemployeeDao.getDetailFaculty(semeter);
        request.setAttribute("listFacutly",list);
        RequestDispatcher req =request.getRequestDispatcher("/pages/aaoemployee/detailfaculty.jsp");
        req.forward(request,response);
    }
    private static int semeter=201;
}
