package com.Learning.aaoemployee;

import com.Learning.common.dao.student.studentDao;
import com.Learning.common.dao.aaoemployee.aaoemployeeDao;
import com.Learning.common.model.aaoemployee.SubclassDetail;
import com.Learning.common.model.student.subclass;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class updateclassController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String btn = (String) request.getParameter("btn-form");
        String[] listbtn=btn.split(" ");
        List<subclass> list;
        String[] listvalue;
        String mess="";
        RequestDispatcher req;
        switch (listbtn[0]) {
            case "find":
                if(!request.getParameter("semesterfind").equals("")) {
                    semester = request.getParameter("semesterfind");
                }
                list = aaoemployeeDao.getListSubclassInSemester(semester);
                request.setAttribute("listclass", list);

                req = request.getRequestDispatcher("/pages/aaoemployee/updateclass.jsp");
                req.forward(request, response);
                break;
            case "detail":
                SubclassDetail subclassDetail=aaoemployeeDao.getSubclassDetail(listbtn[1],listbtn[2],listbtn[3],listbtn[4]);
                request.setAttribute("subclassDetail",subclassDetail);
                req=request.getRequestDispatcher("/pages/aaoemployee/subclassdetail.jsp");
                req.forward(request,response);
                break;
            case "edit":
                int yearedit=Integer.parseInt(request.getParameter("yearedit"));
                int semesteridedit=Integer.parseInt(request.getParameter("semesteredit"));
                String subjectidedit=(String) request.getParameter("subjectidedit");
                String subclassidedit=(String) request.getParameter("subclassidedit");
                String oldvalue=(String) request.getParameter("oldedit");
                String [] listOld=oldvalue.split(" ");
                mess =aaoemployeeDao.updateClass(listOld[2],listOld[0],listOld[1],listOld[3],subjectidedit,yearedit,semesteridedit,subclassidedit);
                if (mess.equals(""))mess="Chỉnh sửa Lớp học thành công!";
                request.setAttribute("status",mess);
                list = aaoemployeeDao.getListSubclassInSemester(semester);
                request.setAttribute("listclass", list);
                req = request.getRequestDispatcher("/pages/aaoemployee/updateclass.jsp");
                req.forward(request, response);
                break;
            case "add":
                        int yearadd=Integer.parseInt(request.getParameter("yearadd"));
                        int semesterid=Integer.parseInt(request.getParameter("semesteradd"));
                        String subjectid=(String) request.getParameter("subjectid");
                        String subclassid=(String) request.getParameter("subclassid");

                         mess =aaoemployeeDao.addClass(subjectid,yearadd,semesterid,subclassid);
                        if (mess.equals(""))mess="Thêm Lớp học thành công!";
                        request.setAttribute("status",mess);
                        list = aaoemployeeDao.getListSubclassInSemester(semester);
                        request.setAttribute("listclass", list);
                         req = request.getRequestDispatcher("/pages/aaoemployee/updateclass.jsp");
                        req.forward(request, response);
                break;
            case "remove":
                   listvalue=request.getParameterValues("userlist");
                for (String values:listvalue) {
                    String[] listparam=values.split(" ");
                    mess=aaoemployeeDao.deleteClass(listparam[0],listparam[1],listparam[2],listparam[3]);
                }
                if (mess.equals(""))mess="Xoá Lớp học thành công!";
                request.setAttribute("status",mess);
                list = aaoemployeeDao.getListSubclassInSemester(semester);
                request.setAttribute("listclass", list);
                req = request.getRequestDispatcher("/pages/aaoemployee/updateclass.jsp");
                req.forward(request, response);
                break;
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<subclass> list = aaoemployeeDao.getListSubclassInSemester(semester);
        request.setAttribute("listclass", list);
        RequestDispatcher res = request.getRequestDispatcher("/aaoemployee/updateclass");
        res.forward(request, response);
    }

    private static String  semester = "201";
}
