<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>
    <title>Şifre Değiştirme</title>
</head>

<body>
<div id="changepassword">
    <h3 class="text-center text-white pt-5"></h3>
    <div class="container">
        <div id="changepassword-row" class="row justify-content-center align-items-center">
            <div id="changepassword-column" class="col-md-6">
                <div id="changepasswrod-box" class="col-md-12">
                    <h3 class="text-center text-info">Şifre Değiştirme</h3>

                    <%
                        Object loginObj = request.getAttribute("changePasswordError");
                        if ( loginObj != null ) {
                            String errorMessage = ""+loginObj;
                    %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Hata!</strong> <%=errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% } %>



                    <form  class="form" action="change-password" method="post">


                        <div class="form-group">

                            <input type="text" class="form-control" name="oldPassword" placeholder="Eski Şifre" required />
                        </div>
                        <div class="form-group">

                            <input type="text" class="form-control" name="newPassword" placeholder="Yeni Şifre" required />
                        </div>
                        <div class="form-group">

                            <input type="submit" name="kaydet" class="btn btn-info btn-md" value="Kaydet">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>