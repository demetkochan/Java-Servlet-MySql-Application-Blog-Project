package com.works.blog;

import props.Blogs;
import utils.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "blogDetailServlet",value = "/blog-detail")
public class BlogDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bid = Integer.parseInt(req.getParameter("bid")) ;

        req.getSession().setAttribute("detailBid",bid);


        DBUtil util = new DBUtil();
        Blogs blogs = util.singleBlog(bid);

        req.setAttribute("blogs",blogs);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/blogDetail.jsp");
        dispatcher.forward(req,resp);



    }
}
