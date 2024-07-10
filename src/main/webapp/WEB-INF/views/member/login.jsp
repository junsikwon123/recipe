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
    <title>Title</title>
    <script>
        const msg='${msg}'
        if(msg!==""){
            alert(msg)
        }
    </script>
</head>
<body>
<form action="/member/login" method="post">
    <input name="username" type="text" placeholder="아이디">
    <input name="password" type="password" placeholder="비밀번호">
    <input type="submit" value="로그인">
</form>
<br>
<a href="searchfrm">
    <button>아이디/비밀번호 찾기</button>
</a>
</body>
</html>
