<%--
  Created by IntelliJ IDEA.
  User: Demet Koçhan
  Date: 8.08.2021
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html>
<head>
    <meta charset="UTF-8">
    <title>İletişim</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="ContactStylePage.css" rel="stylesheet">
</head>
<body>
<div class="box-area">
    <header>
        <div class="wrapper">
            <nav>
                <a href="homePage.jsp">Ana sayfa</a> <a href="about.jsp">Hakkımızda</a>   <a href="#">İletişim</a>
            </nav>
        </div>
    </header>
    <div class="banner-area">
        <h2>İLETİŞİM</h2>
    </div>
    <div class="content-area">
        <div class="wrapper">
            <%
                Object insertErrorObject = request.getAttribute("contactError");
                if ( insertErrorObject != null ) {
                    String errorMessage = ""+insertErrorObject;
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hata!</strong> <%=errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>

            <form action="blog-contact" method="post" >
                <div class="mb-3">
                    <input type="text" name="name" placeholder="İsim" class="form-control" required />
                </div>
                <div class="mb-3">
                    <input type="text" name="email" placeholder="E-Mail" class="form-control" required />
                </div>
                <div class="mb-3">
                    <input type="text" name="number" placeholder="Telefon" class="form-control" required />
                </div>
                <div class="form-floating">
                    <textarea class="form-control" name="message" maxlength="1000" placeholder="Leave a comment here" id="message" required></textarea>
                    <label for="message">Mesaj</label>
                </div>
                <button onclick="show_alert()" class="btn btn-success"> Gönder </button>
            </form>



        </div>
    </div>
    <script>
        function show_alert(){
            return confirm("Göndermek istediğinizden emin misiniz?")
        }

    </script>

</div>


</body>
</html>

