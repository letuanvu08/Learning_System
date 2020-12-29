package com.Learning.profile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.student.studentDao;
import com.Learning.common.model.student.Student;
import com.Learning.common.model.user.User;

@WebServlet("/changepassword")
public class ChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher req = request.getRequestDispatcher("/pages/changepassword.jsp");
            req.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        User user = UserDao.getUserFromUserID(userID);
        System.out.println(user.getpassword());
        System.out.println(user.getUsername());

        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        String mess = UserDao.changePasswordFromUsername(user.getAccountName(),oldpassword, newpassword);
        if (!mess.equals("")) {
            request.setAttribute("error", mess);
            RequestDispatcher rd = request.getRequestDispatcher("/pages/changepassword.jsp");
            rd.forward(request, response);
        } else {
            Student student = studentDao.getProfile(user.getUserID());
            request.setAttribute("user", user);
            request.setAttribute("student", student);
            request.setAttribute("error", "Đổi mât khẩu thành công!");
            RequestDispatcher reqs = request.getRequestDispatcher("/" + user.getUserType().toString() + "/profile");
            reqs.forward(request, response);
        }
    }

}
