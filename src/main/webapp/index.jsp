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
    <title>Kullanıcı Girişi</title>
</head>

<body>
<div id="login">
    <h3 class="text-center text-white pt-5">Login form</h3>
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <h3 class="text-center text-info">Kullanıcı Girişi</h3>

                    <%
                        Object loginObj = request.getAttribute("loginError");
                        if ( loginObj != null ) {
                            String errorMessage = ""+loginObj;
                    %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Hata!</strong> <%=errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% } %>



                    <form id="login-form" class="form" action="login-servlet" method="post">


                        <div class="form-group">

                            <input type="email" class="form-control" name="email" placeholder="E-Mail" required />
                        </div>
                        <div class="form-group">

                            <input type="password" class="form-control" name="password" placeholder="Şifre" required />
                        </div>
                        <div class="form-group">
                            <label for="remember-me" class="text-info"><span>Beni Hatırla</span> <span><input id="remember-me" name="remember" type="checkbox"></span></label><br>
                            <input type="submit" name="submit" class="btn btn-info btn-md" value="Giriş">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>