
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>

<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>

<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">


    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="homePage.jsp">Ana Sayfa</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Profile
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="change-password">Şifre Değiştir</a></li>
                            <li><a class="dropdown-item" href="logout">Çıkış</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=adm.getName()%></a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
    <hr/>
    <div class="row">
        <div class="col-sm-4">
            <h2>Blog Ekle</h2>

            <%
                Object insertErrorObject = request.getAttribute("insertError");
                if ( insertErrorObject != null ) {
                    String errorMessage = ""+insertErrorObject;
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hata!</strong> <%=errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>

            <form action="blog-insert" method="post" >
                <div class="mb-3">
                    <input type="text" name="title" placeholder="Başlık" class="form-control" required />
                </div>
                <div class="form-floating">
                    <textarea class="form-control" name="detail" maxlength="10000" placeholder="Leave a comment here" id="detail"></textarea>
                    <label for="detail">Detay</label>
                </div>
                <button class="btn btn-success"> Kaydet </button>
            </form>
        </div>
        <div class="col-sm-8">
            <h2>Blog Listesi</h2>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Bid</th>
                    <th scope="col">Başlık</th>
                    <th scope="col">Detay</th>

                </tr>
                </thead>
                <tbody>
                <%
                    int aid = adm.getAid();
                %>
                <c:if test="${ dbUtil.allBlogs(aid).size() == 0 }">
                    <tr>Blog Yok</tr>
                </c:if>

                <c:if test="${ dbUtil.allBlogs(aid).size() > 0 }">
                    <c:forEach items="${ dbUtil.allBlogs(aid) }" var="item" >
                        <tr>
                            <th scope="row"><c:out value="${item.bid}"></c:out></th>
                            <td><c:out value="${item.title}"></c:out></td>
                            <td><c:out value="${item.detail}"></c:out></td>
                            <td>
                                <a  href="blog-update?bid=${item.bid}" class="btn btn-warning btn-sm">Düzenle</a>
                                <a onclick="return show_alert()" href="blog-insert?bid=${item.bid}" class="btn btn-danger btn-sm">Sil</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>

        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>
        function show_alert(){
            return confirm("Silmek istediğinizden emin misiniz?")
        }

    </script>
</div>
</body>
</html>
