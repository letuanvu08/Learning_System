package com.Learning.Login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Learning.common.dao.UserDao;
import com.Learning.common.model.User;

import java.io.IOException;

@WebServlet("/authentication")
public class Authorizer extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private boolean verify(String password, User user) {
        if (user == null || !user.getpassword().equals(password)) return false;
        return true;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = UserDao.getUserFromUsername(username);

        if (!verify(password, user)) {
            //redirect to login
            request.setAttribute("error", true);
            RequestDispatcher rd=request.getRequestDispatcher("/login");
            rd.forward(request, response);
            return;
        }
        //Create a log in session
        HttpSession session = request.getSession();
        session.setAttribute("userID", user.getUserID());
        response.sendRedirect(request.getContextPath());
    }

    protected void DoGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }
}
