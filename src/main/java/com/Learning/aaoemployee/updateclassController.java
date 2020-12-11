package com.Learning.aaoemployee;

import com.Learning.common.dao.student.studentDao;
import com.Learning.common.dao.aaoemployee.aaoemployeeDao;
import com.Learning.common.model.aaoemployee.SubclassDetail;
import com.Learning.common.model.student.Student;
import com.Learning.common.model.student.subclass;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;


public class updateclassController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String btn = (String) request.getParameter("btn-form");
        List<subclass> list;
        switch (btn) {
            case "find":
                if(!request.getParameter("semesterfind").equals("")) {
                    semester = Integer.parseInt(request.getParameter("semesterfind"));
                }
                list = studentDao.getListSubclassInSemester(semester);
                request.setAttribute("listclass", list);

                RequestDispatcher req = request.getRequestDispatcher("/pages/aaoemployee/updateclass.jsp");
                req.forward(request, response);
                break;
            case "detail":
                String value=(String) request.getParameter("valuedetail");
                System.out.println(value);
                String[] listvalue=value.split(" ");
                SubclassDetail subclassDetail=aaoemployeeDao.getSubclassDetail(Integer.parseInt(listvalue[0]),Integer.parseInt(listvalue[1]),listvalue[2],listvalue[3]);
                request.setAttribute("subclassDetail",subclassDetail);
                System.out.println(subclassDetail.getListstudent().get(0).getName());
                System.out.println(subclassDetail.getListlecturer().get(0).getName());
                RequestDispatcher res=request.getRequestDispatcher("/pages/aaoemployee/subclassdetail.jsp");
                res.forward(request,response);
                break;
            case "edit":

                break;
            case "add":
                        int yearadd=Integer.parseInt(request.getParameter("yearadd"));
                        int semesterid=Integer.parseInt(request.getParameter("semesteradd"));
                        String subjectid=(String) request.getParameter("subjectid");
                        String subclassid=(String) request.getParameter("subclassid");
                        String lecturerid=(String) request.getParameter("lecturerid");
                        String mess =aaoemployeeDao.addClass(subjectid,yearadd,semesterid,subclassid,lecturerid);
                        if (mess.equals(""))mess="Thêm Lớp học thành công!";
                        request.setAttribute("status",mess);
                        list = studentDao.getListSubclassInSemester(semester);
                        request.setAttribute("listclass", list);
                        RequestDispatcher res2 = request.getRequestDispatcher("/pages/aaoemployee/updateclass.jsp");
                        res2.forward(request, response);
                break;

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<subclass> list = studentDao.getListSubclassInSemester(semester);
        request.setAttribute("listclass", list);
        RequestDispatcher res = request.getRequestDispatcher("/aaoemployee/updateclass");
        res.forward(request, response);
    }

    private static int semester = 201;
}
