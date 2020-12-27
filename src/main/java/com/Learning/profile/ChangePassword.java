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
import com.Learning.common.model.user.User;

@WebServlet("/changepassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private boolean verify(String username, String password, User user) {	

		if (user == null || !user.getpassword().equals(password)) return false;
		return true;
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher req=request.getRequestDispatcher("/pages/changepassword.jsp");
		req.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		User user = UserDao.getUserFromUserID(userID);
		String req = request.getParameter("btn");
		System.out.println(user.getpassword());
		System.out.println(user.getUsername());
		switch(req) {
		case "xacnhan":
			String oldpassword = request.getParameter("oldpassword");
			String newpassword = request.getParameter("newpassword");
			if (!verify(user.getUsername(), oldpassword, user)) {
				request.setAttribute("error", 1);
				RequestDispatcher rd=request.getRequestDispatcher("/pages/changepassword.jsp");
				rd.forward(request, response);
				return;
			}
			else if (oldpassword.equals(newpassword)) {
				request.setAttribute("error", 2);
				RequestDispatcher rd=request.getRequestDispatcher("/pages/changepassword.jsp");
				rd.forward(request, response);
				return;
			}

			UserDao.changePasswordFromUsername(user.getAccountName(),newpassword);	

			RequestDispatcher rd = request.getRequestDispatcher("/"+user.getUserType().toString()+"/main");
			rd.forward(request, response);

			return;
		case "huybo":

			RequestDispatcher rd1 = request.getRequestDispatcher("/"+user.getUserType().toString()+"/main");
			rd1.forward(request, response);
			return;
		}
		
		
	}

}
