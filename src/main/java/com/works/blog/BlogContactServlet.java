package com.works.blog;

import props.Contacts;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "blogContactServlet",value = "/blog-contact")
public class BlogContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(Util.base_url+"contact.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String number = req.getParameter("number");
        String message = req.getParameter("message");

        Contacts contacts = new Contacts();
        contacts.setName(name);
        contacts.setEmail(email);
        contacts.setNumber(number);
        contacts.setMessage(message);

        DBUtil util = new DBUtil();
        int status = util.blogContact(contacts);

        if(status>0){
            resp.sendRedirect(Util.base_url+"homePage.jsp");


        }else{
            String errorMessage ="Ekleme sırasında bir hata oluştu";

            req.setAttribute("contactError",errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contact.jsp");
            dispatcher.forward(req,resp);


        }



    }
}
