package com.Learning.Student;

import com.Learning.common.dao.student.studentDao;

import com.Learning.common.model.student.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NoCreditStudent")
public class NoCreditStudentControler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String userID=(String)session.getAttribute("userID");
        Student student=studentDao.getProfile(userID);
        List<NoCredit> listNoCredit=studentDao.getAllNoCreditSemester(student.getStudentID());
        request.setAttribute("listNoCredit",listNoCredit);
        request.setAttribute("sum",sumNocredit(listNoCredit));
        RequestDispatcher res=request.getRequestDispatcher("/pages/student/listNoCredit.jsp");
        res.forward(request,response);
    }
    private int sumNocredit(List<NoCredit> list){
        int sum=0;
        for (NoCredit nocredit:list) {
            sum+=nocredit.getNocredit();

        }
        return sum;
    }
}
