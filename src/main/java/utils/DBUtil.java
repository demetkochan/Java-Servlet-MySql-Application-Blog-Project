package utils;

import props.Blogs;
import props.Contacts;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBUtil {

    public boolean login(String email, String password, String remember, HttpServletRequest req, HttpServletResponse resp){
        boolean status = false;
        DB db = new DB();
        try {
            String sql = "select * from admin where email =? and password= ?";
            PreparedStatement pre =db.conn.prepareStatement(sql);
            pre.setString(1,email);
            pre.setString(2, Util.MD5(password));
            ResultSet rs = pre.executeQuery();
            status = rs.next();

            //session oluşturma kısmı
            if(status){
                int aid = rs.getInt("aid");
                String name = rs.getString("name");
                //session tetiklenmese bile içi boş şekilde arkada oluşturulur
                req.getSession().setAttribute("aid", aid); //session id elemanı üzerinden yapılmalı
                req.getSession().setAttribute("name",name);

                //cookie create - 10_ali
                if(remember != null && remember.equals("on")) {
                    name = name.replaceAll(" ", "_");
                    String val = aid + "_" + name;
                    Cookie cookie = new Cookie("user", val); //cookie içinde verileri tuttuk
                    cookie.setMaxAge(60 * 60);
                    resp.addCookie(cookie);

                }
            }

        }catch (Exception ex){
            System.err.println("Login Error: " + ex);

        }finally {
            db.close();
        }


        return status;
    }

    public int changePassword(String oldpassword ,String newPassword, int aid){
        int status = 0;
        DB db = new DB();

        try{
            String sql = "update admin set password =? where password = ? and  aid=?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,Util.MD5(newPassword));
            pre.setString(2,Util.MD5(oldpassword));
            pre.setInt(3,aid);
            status = pre.executeUpdate();

        }catch (Exception e){
            System.err.println("changePassword Error : " + e);

        }finally {
            db.close();
        }

        return status;
    }


    public int blogInsert(Blogs blogs , int aid){
        int status = 0;

        DB db = new DB();
        try{
            String sql = "insert into blogs values(null,?,?,now(),? )";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,blogs.getTitle());
            pre.setString(2,blogs.getDetail());
            pre.setInt(3,aid);
            status = pre.executeUpdate();
        }catch (Exception e){
            System.err.println("blogInsert Error: " + e);
            if(e.toString().contains("SQLIntegrityConstraintViolationException")){
                status =-1;
            }
        }finally {
            db.close();
        }


        return status;



    }

    public List<Blogs> allBlogsHome(){
        List<Blogs> ls = new ArrayList<>();
        DB db = new DB();

        try{
            String sql = "select * from blogs ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int bid = rs.getInt("bid");
                String title =rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");


                Blogs blogs = new Blogs(bid,title,detail,date);
                ls.add(blogs);

            }

        }catch (Exception e){
            System.err.println("allBlogs Error: " + e);

        }finally {
            db.close();
        }


        return ls;

    }

    public List<Blogs> allBlogs(int aid){
        List<Blogs> ls = new ArrayList<>();
        DB db = new DB();

        try{
            String sql = "select * from blogs where aid=? ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int bid = rs.getInt("bid");
                String title =rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");

                Blogs blogs = new Blogs(bid,title,detail,date);
                ls.add(blogs);

            }

        }catch (Exception e){
            System.err.println("allBlogs Error: " + e);

        }finally {
            db.close();
        }


        return ls;




    }

    public int blogDelete(int bid){

        int status = 0;
        DB db = new DB();

        try{
            String sql = "delete from blogs where bid=?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,bid);
            status = pre.executeUpdate();



        }catch (Exception e){
            System.err.println("blogDelete Error: " + e);

        }finally {
            db.close();
        }

        return status;
    }

    public boolean isBlogValidate(int cbid, int aid){
        boolean status = false;
        DB db = new DB();

        try {
            String sql = "select * from blogs where bid=? and aid=?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,cbid);
            pre.setInt(2,aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        }catch (Exception e){
            System.err.println("BlogValidate Error : " + e);
        }finally {
            db.close();
        }




        return status;

    }


    public Blogs singleBlog(int bid){
       Blogs blogs = new Blogs();
       DB db = new DB();

       try{
           String sql = "select * from blogs where bid= ?";
           PreparedStatement pre = db.conn.prepareStatement(sql);
           pre.setInt(1,bid);
           ResultSet rs = pre.executeQuery();
           if(rs.next()){
               int bidx = rs.getInt("bid");
               String title = rs.getString("title");
               String detail = rs.getString("detail");
               Date date = rs.getDate("date");
               blogs = new Blogs(bidx,title,detail,date);
               return blogs;
           }

       }catch (Exception e){
           System.err.println("singleBlog Error : " + e);
       }finally {
           db.close();
       }



       return blogs;

    }

    public int updateBlog(String title, String detail,int bid){
        int status= 0;
        DB db = new DB();

        try {
            String sql =" update blogs set title = ?,detail=? where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,title);
            pre.setString(2,detail);
            pre.setInt(3,bid);
            status = pre.executeUpdate();


        }catch (Exception e){
            System.err.println("updateBlog Error :" + e);
        }finally {
            db.close();
        }



        return status;

    }

    public int blogContact(Contacts contacts ){
        int status = 0;

        DB db = new DB();
        try{
            String sql = "insert into contact values(null,?,?,?,?)";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,contacts.getName());
            pre.setString(2,contacts.getEmail());
            pre.setString(3,contacts.getNumber());
            pre.setString(4,contacts.getMessage());
            status = pre.executeUpdate();
        }catch (Exception e){
            System.err.println("contactInsert Error: " + e);
        }finally {
            db.close();
        }


        return status;



    }




}
