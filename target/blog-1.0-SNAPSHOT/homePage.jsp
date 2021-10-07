<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<head>
    <meta charset="UTF-8">
    <title>Ana Sayfa</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="styleHomePage.css" rel="stylesheet">
</head>
<body>
<div class="box-area">
    <header>
        <div class="wrapper">
            <nav>
                <a href="#">Ana sayfa</a> <a href="about.jsp">Hakkımızda</a>   <a href="blog-contact">İletişim</a>
            </nav>
        </div>
    </header>
    <div class="banner-area">
        <h2>BLOGS</h2>
    </div>
    <div class="content-area" >

                <c:forEach items="${ dbUtil.allBlogsHome() }" var="item" >
                    <h3>
                        <a href="blog-detail?bid=${item.bid}" style="color: #262626" >
                                ${item.title}
                        </a>
                    </h3>
                    <p>
                            ${item.detail}

                    </p>
                    <p>
                            ${item.date}
                    </p>

                </c:forEach>



    </div>
</div>

</body>
</html>
