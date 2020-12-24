package com.Learning.profile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.Learning.common.dao.User.UserDao;

import com.Learning.common.model.student.Student;
import com.Learning.common.dao.student.studentDao;
import com.Learning.common.model.user.User;

//@WebServlet("profileservlet")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Object attribute = session.getAttribute("userID");
		if (attribute == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		User user = UserDao.getUserFromUserID(((String) attribute));
		Student student =studentDao.getProfile(user.getUserID());
		request.setAttribute("user", user);
		request.setAttribute("student", student);
		RequestDispatcher rd = request.getRequestDispatcher("/"+user.getUserType().toString()+"/profile");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

