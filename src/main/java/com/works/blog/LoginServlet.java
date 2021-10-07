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

@WebServlet(name = "loginServlet" , value = "/login-servlet")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ip = ""+ req.getAttribute("ip");

        String email =req.getParameter("email");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        DBUtil util = new DBUtil();
        boolean status = util.login(email,password,remember,req,resp);

        if(status){
            resp.sendRedirect(Util.base_url+"dashboard.jsp");
        }else{
            req.setAttribute("loginError","Kullanıcı yada şifre hatalı");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/");
            dispatcher.forward(req,resp);


        }









    }
}
