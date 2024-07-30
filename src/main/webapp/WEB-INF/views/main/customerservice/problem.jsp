<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 30.
  Time: 오후 6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
    <jsp:include page="../common/header.jsp"></jsp:include>
</header>
<main>
    <h1 style="font-size: large; margin-top: 10px; margin-left: 400px">HOME > 고객센터 > 자주 묻는 질문</h1>
    <h1 style="font-size: xx-large; margin-top: 30px; margin-left: 400px; font-weight: bold">자주 묻는 질문</h1>
    <div style="width: 180px; height: 230px; background-color: #F5F5F5; margin-left: 400px; margin-top: 20px; justify-content: center; border-radius: 20px">
        <br>
        <a class="customerCenter-menu Active" href="/customer/center" style="font-size: large; margin-left: 20px"> 공지사항</a><br><br>
        <a class="customerCenter-menu" href="/customer/problem" style="font-size: large; margin-left: 20px"> 자주 묻는 질문</a><br><br>
        <a class="customerCenter-menu" href="/customer/battle" style="font-size: large; margin-left: 20px"> 1:1신청</a><br><br>
        <a class="customerCenter-menu" href="/customer/dogsound" style="font-size: large; margin-left: 20px"> 진상의 소리</a><br><br>
        <p style="margin-top: 20px; color: #77b347; font-size: xx-large">상담사</p>
        <p style="color: #77b347; font-size: xx-large">황 인 욱</p>
        <p style="color: #77b347; font-size: x-large">010-2857-8839</p>
        <p>평일, 주말, 공휴일 및 시간에 관계없이 편하실 때 전화주세요</p>
    </div>
</main>
</body>
</html>
