<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 19.
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script defer src="/common/js/common.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<input value="${tDto.t_num}" style="display: none">
<input value="${tDto.t_title}"><br>
<c:forEach items="${itemArray}" var="item" varStatus="loop">
    <input value="${item}" readonly>
    <input placeholder="남은갯수:${itemcountArray[loop.index]}">
    <input value="${unitArray[loop.index]}" readonly>
    <input value="${changeArray[loop.index]}">
    <hr>
</c:forEach>
</body>
</html>
