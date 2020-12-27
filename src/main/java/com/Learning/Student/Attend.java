package com.Learning.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import com.Learning.common.dao.student.studentDao;
import com.Learning.common.dao.User.UserDao;
import com.Learning.common.model.student.*;
import com.Learning.common.model.user.User;

@WebServlet(name = "attend")
public class Attend extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Student student = studentDao.getProfile(userID);
        String subclass_class = request.getParameter("btn_dk");
        System.out.println(subclass_class);
        String[] subid = subclass_class.split(" ");
        String check;
        if (subid[0].equals("xoa")) {
            check = studentDao.DeleteAttend(student, subid[1], subid[2], Integer.parseInt(subid[3]));
            if (check.equals("")) check = "Xóa môn học thành công";
            subid[0] = subid[1];
            request.setAttribute("lecturer_featured", "lecturer_featured");
            request.setAttribute("statusAttend", check);
        } else if (subid[0].equals("find")) {
            String subjectID=request.getParameter("subjectid");
            System.out.println(subjectID);
                List<subclass> listclassfind=studentDao.getListSubclassInSemesterBYCID(student.getSemester(),subjectID);
                request.setAttribute("listsubclassfind",listclassfind);
        } else {
            check = studentDao.attend(student, subid[0], subid[1], Integer.parseInt(subid[2]));
            if (check.equals("")) check = "Đăng ký thành công";
            request.setAttribute("statusAttend", check);
        }
        RequestDispatcher req = request.getRequestDispatcher("/pages/student/attend.jsp");
        List<subclass> list = studentDao.getListSubclassInSemester(student.getSemester());
        List<subclass> listClassAttend;
        listClassAttend = studentDao.getListSubclassAttended(student.getStudentID(), student.getSemester());
        request.setAttribute("listSubclass", list);
        request.setAttribute("listattended", listClassAttend);

        req.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        Student student = studentDao.getProfile(userID);
        List<subclass> list = studentDao.getListSubclassInSemester(student.getSemester());

        request.setAttribute("listSubclass", list);
        List<subclass> listClassAttend;
        listClassAttend = studentDao.getListSubclassAttended(student.getStudentID(), student.getSemester());
        System.out.println(listClassAttend.size());
        request.setAttribute("listattended", listClassAttend);
        RequestDispatcher req = request.getRequestDispatcher("/pages/student/attend.jsp");
        req.forward(request, response);

    }
}
