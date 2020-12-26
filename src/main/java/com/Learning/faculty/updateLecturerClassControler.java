package com.Learning.faculty;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.student.studentDao;
import com.Learning.common.dao.aaoemployee.aaoemployeeDao;
import com.Learning.common.dao.faculty.facultyDao;
import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.faculty.SubjectFaculty;
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

@WebServlet(name = "updateLecturerClass")
public class updateLecturerClassControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        String values=request.getParameter("valueform");
        String[] list=values.split(" ");
        String lecturerID=request.getParameter("lectuerID");
        String[] listWlectuer=request.getParameterValues("lectuerIDW");
        System.out.println(request.getParameter("lectuerIDW"));
        System.out.println(request.getParameter("numberWeek"));
        String[] listnumber=request.getParameterValues("numberWeek");
        String mess="";
        if(listWlectuer!=null){
            for(int i=0;i<listWlectuer.length;i++)
            mess+=facultyDao.UpdateLecturerWeekClass(list[0],list[1],list[2],list[3],listnumber[i],listWlectuer[i]);
        }
        mess+=facultyDao.UpdateLecturerClass(list[0],list[1],list[2],list[3],lecturerID);
        if(!mess.equals(""))mess="ID Giang Viên: " +lecturerID +" không đúng";
        request.setAttribute("status",mess);
        List<subclass> listpost = facultyDao.getListSubclassInSemesterFaculty(year,semester,employee.getFacultyName());
        request.setAttribute("listSubclass", listpost);
        RequestDispatcher req = request.getRequestDispatcher("/pages/faculty/updatelecturerclass.jsp");
        req.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        List<subclass> listget = facultyDao.getListSubclassInSemesterFaculty(year,semester,employee.getFacultyName());
        request.setAttribute("listSubclass", listget);
        RequestDispatcher req = request.getRequestDispatcher("/pages/faculty/updatelecturerclass.jsp");
        req.forward(request, response);
    }

    private static int semester=201;
    private static int year=2020;

}
