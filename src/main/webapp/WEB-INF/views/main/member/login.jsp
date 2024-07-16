<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 3.
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css?h=cb606d99bb2418df19b6bc818b41e412">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="/assets/css/styles.min.css?h=94c76ca45cf1136042bce4cad72a7b5e">
    <script>
        const msg='${msg}'
        if(msg!==""){
            alert(msg)
        }
    </script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div style="text-align: center">
<form action="/member/login" method="post">
    <input name="username" type="text" placeholder="아이디" style="margin-top: 100px; margin-bottom: 10px; height: 50px"><br>
    <input name="password" type="password" placeholder="비밀번호" style="margin-bottom: 20px; height: 50px"><br>
    <button type="submit" class="btn btn-primary">로그인</button>
</form>
</div>
<div style="text-align: center; margin-top: 30px">
<a href="searchfrm">
    <button type="submit" class="btn btn-danger">아이디/비밀번호찾기</button>
</a>
</div>
</body>
</html>
