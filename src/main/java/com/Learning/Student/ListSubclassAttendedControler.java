package com.Learning.Student;

import com.Learning.common.dao.student.studentDao;
import com.Learning.common.model.student.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.Learning.common.model.student.*;
@WebServlet(name = "ListSubclassAttended")
public class ListSubclassAttendedControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<subclass> list= new ArrayList<>();
        HttpSession session =request.getSession();
        String userID=(String) session.getAttribute("userID");
        Student student= studentDao.getProfile(userID);
        list=studentDao.getListSubclassAttended(student.getStudentID(),201);
        System.out.println(list.size());
        request.setAttribute("listsubclass",list);

        RequestDispatcher res=request.getRequestDispatcher("/pages/student/ListSubclassAttended.jsp");
        res.forward(request,response);
    }
}
