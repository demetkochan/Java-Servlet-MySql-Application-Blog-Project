package com.works.blog;

import props.Blogs;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "blogUpdateServlet",value = "/blog-update")
public class BlogUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int bid = Integer.parseInt(req.getParameter("bid")) ;

        req.getSession().setAttribute("updateBid",bid);


        DBUtil util = new DBUtil();
        Blogs blogs = util.singleBlog(bid);


        req.setAttribute("blogs",blogs);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blogUpdate.jsp");
        dispatcher.forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean bidStatus = req.getSession().getAttribute("updateBid") != null;

        if(bidStatus){
            String title = req.getParameter("title");
            String detail = req.getParameter("detail");
            int pid = (int) req.getSession().getAttribute("updateBid");

            DBUtil util = new DBUtil();
            int status = util.updateBlog(title,detail,pid);

            req.getSession().removeAttribute("updateBid");



        }
        resp.sendRedirect(Util.base_url+"dashboard.jsp");


    }
}
