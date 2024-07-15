<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 10.
  Time: 오후 3:14
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
<header>
<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<a href="/trade/write">글쓰기</a>
<hr>
<c:forEach var="trade" items="${tList}">
    <p><a href="/trade/detail?t_num=${trade.t_num}">${trade.t_title}</a></p>
</c:forEach>
<p></p>
<p></p>
<p></p>
</body>
</html>
