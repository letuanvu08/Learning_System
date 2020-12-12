package com.Learning.Login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Learning.common.dao.UserDao;
import com.Learning.common.model.User;


public class MainPage extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object object = session.getAttribute("userID");
        if (object == null) {
            response.sendRedirect("login");
        } else {
            String  userID = (String)object ;

            User user = UserDao.getUserFromUserID(userID);
            if (user != null) {
                switch (user.getUserType()) {
                    case STUDENT:
                        response.sendRedirect("student/main");
                        break;
                    case AAOEMPLOYEE:
                        response.sendRedirect("aaoemployee/main");
                        break;
                    case LECTURER:
                        response.sendRedirect("lecturer/main");
                        break;
                    case FACULTY:
                        response.sendRedirect("faculty/main");
                }

            } else {
                request.setAttribute("test",userID);
                RequestDispatcher req=request.getRequestDispatcher("/welcom.jsp");
                req.forward(request,response);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
