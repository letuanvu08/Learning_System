package com.Learning.lecturer;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.faculty.facultyDao;
import com.Learning.common.dao.lecturer.lecturerDao;
import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.lecturer.SubjectLecturer;
import com.Learning.common.model.student.Student;
import com.Learning.common.model.student.subclass;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listclasslecturer")
public class listclasslecturerControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String values = request.getParameter("btn-form");
        String[] listvalues=values.split(" ");
        List<Student> liststudent= facultyDao.getListStudentFaculty(listvalues[1],listvalues[2],listvalues[3],listvalues[4]);
        request.setAttribute("liststudent",liststudent);
        RequestDispatcher req = request.getRequestDispatcher("/pages/lecturer/liststudentlecturer.jsp");
        req.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        List<subclass> listsubclass = lecturerDao.getListSubclassOfLectuer(semester,employee.getId());
        request.setAttribute("listsubclass", listsubclass);
        RequestDispatcher req = request.getRequestDispatcher("/pages/lecturer/listclasslecturer.jsp");
        req.forward(request, response);
    }
    private static String semester="201";
}
