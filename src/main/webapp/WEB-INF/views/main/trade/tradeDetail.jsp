<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 11.
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script defer src="/common/js/common.js"></script>
    <script defer src="/common/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<input value="${tDto.t_title}"><br>
<c:forEach items="${itemArray}" var="item" varStatus="loop">
    <input value="${item}">
    <input value="${itemcountArray[loop.index]}">
    <input value="${unitArray[loop.index]}">
    <input value="${changeArray[loop.index]}">
    <hr>
</c:forEach>
</body>
</html>
