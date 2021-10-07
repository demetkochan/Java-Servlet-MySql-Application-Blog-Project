<%@ page import="props.Blogs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Blog Detay</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
     <link href="styleDetailPage.css" rel="stylesheet">
</head>
<body>

<div class="box-area">
  <header>
    <div class="wrapper">
      <nav>
        <a href="homePage.jsp">Ana sayfa</a> <a href="about.jsp">Hakkımızda</a>   <a href="blog-contact">İletişim</a>
      </nav>
    </div>
  </header>

  <%
    Blogs blogs = (Blogs) request.getAttribute("blogs");
  %>

  <div class="banner-area">
    <h2> <%=blogs.getTitle()%></h2>
  </div>


  <div class="content-area" >
      <p>
        <%=blogs.getDetail()%>
      </p>

  </div>



</div>

</body>
</html>
