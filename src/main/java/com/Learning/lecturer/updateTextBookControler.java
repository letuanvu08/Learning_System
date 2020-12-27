package com.Learning.lecturer;

import com.Learning.common.dao.User.UserDao;
import com.Learning.common.dao.lecturer.lecturerDao;
import com.Learning.common.model.faculty.Employee;
import com.Learning.common.model.lecturer.SubjectLecturer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "updateTextBook")
public class updateTextBookControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        String values = request.getParameter("btn-form");
        System.out.println(values);
        String[] listValues = values.split(" ");
        RequestDispatcher req;
        String dispatcher="/pages/lecturer/updateTextBook.jsp";
        List<SubjectLecturer> listSubject;
        String mess="";
        switch (listValues[0]) {
            case "update":
            SubjectLecturer subjectLecturer = lecturerDao.getSubjectChargeLecturer(employee.getId(),listValues[1]);
           request.setAttribute("subjectlecturer",subjectLecturer);
            break;
            case "add":
                String ISBN=request.getParameter("addisbn");
                mess=lecturerDao.AddTextbookSubject(ISBN,listValues[1]);
                listSubject= lecturerDao.getListSubjectChargeLecturer(employee.getId());
                request.setAttribute("listsubject", listSubject);
                if(mess.equals(""))
                    mess="Thêm TextBook thành công";
                request.setAttribute("status",mess);
                break;
            case "remove":
                mess=lecturerDao.RemoveTextbookSubject(listValues[2],listValues[1]);
                listSubject = lecturerDao.getListSubjectChargeLecturer(employee.getId());
                request.setAttribute("listsubject", listSubject);
                if(mess.equals(""))
                    mess="Xóa TextBook thành công";
                request.setAttribute("status",mess);
                break;

        }
        req=request.getRequestDispatcher(dispatcher);
        req.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Employee employee = UserDao.getEmployeeByID(userID);
        List<SubjectLecturer> listSubject = lecturerDao.getListSubjectChargeLecturer(employee.getId());
        request.setAttribute("listsubject", listSubject);

        RequestDispatcher req = request.getRequestDispatcher("/pages/lecturer/updateTextBook.jsp");
        req.forward(request, response);
    }
}
