package utils;

import props.Admin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Util {

    public final static String base_url="http://localhost:8080/blog_war_exploded/";


    public static String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }

    public Admin isLogin(HttpServletRequest request, HttpServletResponse response){
        if (request.getCookies() != null){ //eğer cookimiz varsa işlemleri yapar
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie: cookies ){
                if (cookie.getName().equals("user")){ //beni hatırla cookisi yapılmış mı
                    String values = cookie.getValue(); //yapının içindeki değeri getir

                    try{
                        String[] arr= values.split("_");
                        request.getSession().setAttribute("aid",Integer.parseInt(arr[0]));
                        request.getSession().setAttribute("name",arr[1]+" " + arr[2]);

                    }catch (NumberFormatException e){ //cookie değiştirilmeye çalışılırsa cookie patlatılır
                        Cookie cookie1 = new Cookie("user","");
                        cookie1.setMaxAge(0);
                        response.addCookie(cookie1);

                    }

                    break;

                }
            }
        }

        Object sessionObg = request.getSession().getAttribute("aid");
        Admin adm = new Admin();
        if(sessionObg ==null){

            try{
                response.sendRedirect(base_url);

            }catch (Exception ex){
                System.err.println("isLogin error: " + ex);

            }

        }else{
            //dashboard içinde girilen adminin ismi getirilir
            int aid = (int) request.getSession().getAttribute("aid");
            String name = (String) request.getSession().getAttribute("name");
            adm.setAid(aid);
            adm.setName(name);



        }
        return  adm;
    }







}
