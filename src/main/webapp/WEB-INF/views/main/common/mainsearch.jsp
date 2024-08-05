<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 8. 1.
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
    <jsp:include page="../common/header.jsp"></jsp:include>
</header>
<section>
    <h1 style="font-weight: bold; color: #77b347; margin-top: 50px; margin-left: 400px">● - - - - - 검색결과</h1>
</section>
<main>
<%--    <div style="width: 80%; margin: 0 10% 0">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${not empty searchList}">--%>
<%--                <c:set var="isEmptyList" value="true"/>--%>
<%--                <c:forEach var="item" items="${searchList}">--%>
<%--                    <c:if test="${not empty item}">--%>
<%--                        <c:set var="isEmptyList" value="false"/>--%>
<%--                    </c:if>--%>
<%--                </c:forEach>--%>
<%--                <c:if test="${not isEmptyList}">--%>
<%--                    <h3 style="color: #77b347; text-align: center">리스트 확인용</h3>--%>
<%--                    <c:forEach var="item" items="${searchList}">--%>
<%--                        <c:forEach var="subItem" items="${item}">--%>
<%--                            ${subItem}--%>
<%--                            <hr style="height: 3px; border: 0; background-color: blue">--%>
<%--                        </c:forEach>--%>
<%--                    </c:forEach>--%>
<%--                </c:if>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <h2 style="color: #77b347">검색 결과가 존재하지 않습니다.</h2>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </div>--%>
</main>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
</body>
</html>
