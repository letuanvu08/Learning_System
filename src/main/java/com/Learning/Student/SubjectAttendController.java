package com.Learning.Student;

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

import com.Learning.common.dao.student.*;
import com.Learning.common.model.student.*;
@WebServlet(name = "subjectattend")
public class SubjectAttendController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Subject> list= new ArrayList<>();
            HttpSession session =request.getSession();
            String userID=(String) session.getAttribute("userID");

            Student student=studentDao.getProfile(userID);
            list=studentDao.getListSubjectAttend(student.getStudentID(),201);
            System.out.println(list.size());
            request.setAttribute("listsubject",list);

        RequestDispatcher res=request.getRequestDispatcher("/pages/student/subjectAttend.jsp");
        res.forward(request,response);
    }
}
