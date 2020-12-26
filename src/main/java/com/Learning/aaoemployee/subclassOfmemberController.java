package com.Learning.aaoemployee;

import com.Learning.common.dao.student.studentDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.invoke.SwitchPoint;
import java.util.List;

import com.Learning.common.model.student.*;
import com.Learning.common.model.aaoemployee.*;
import com.Learning.common.dao.aaoemployee.*;


@WebServlet(name = "subclassOfmemberController")
public class subclassOfmemberController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ID = request.getParameter("memberid");
        int year = Integer.parseInt(request.getParameter("year"));
        int semester = Integer.parseInt(request.getParameter("semester"));
        String choose = request.getParameter("btn-form");
        List<subclass> list;
        switch (choose) {
            case "student":
                list = aaoemployeeDao.getlistclassofStudent(ID, year, semester);
                request.setAttribute("chooses", "active");
                request.setAttribute("listclasss", list);
                System.out.println(list.size());

                break;
            case "lecturer":
                list = aaoemployeeDao.getlistclassofLecturer(ID, semester);
                System.out.println(ID+ semester);
                System.out.println(list.size());

                request.setAttribute("choosel", "active");
                request.setAttribute("listclassl", list);
                request.setAttribute("lecturer_featured", "lecturer_featured");
                break;
        }

        RequestDispatcher req = request.getRequestDispatcher("/pages/aaoemployee/SubclassOfMember.jsp");
        req.forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("chooses", "active");
        RequestDispatcher req = request.getRequestDispatcher("/pages/aaoemployee/SubclassOfMember.jsp");
        req.forward(request, response);
    }

}
