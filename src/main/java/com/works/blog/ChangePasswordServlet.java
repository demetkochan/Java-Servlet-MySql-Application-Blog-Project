package com.works.blog;

import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "changePasswordServlet" , value = "/change-password")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(Util.base_url+"changePassword.jsp");



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String oldpassword = req.getParameter("oldPassword");
         String newpassword = req.getParameter("newPassword");

        int aid = (int) req.getSession().getAttribute("aid");

        DBUtil util = new DBUtil();
        int status = util.changePassword(oldpassword,newpassword,aid);

        if(status>0){
            resp.sendRedirect(Util.base_url+"dashboard.jsp");

        }else{

            req.setAttribute("changePasswordError","Şifre Değiştirilemedi");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/changePassword.jsp");
            dispatcher.forward(req,resp);

        }



    }
}
