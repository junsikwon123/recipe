<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 10.
  Time: 오전 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script defer src="/common/js/common.js"></script>
    <script defer src="/common/js/jquery-3.7.1.min.js"></script>
    <style>
        .care{
            margin: 0 auto;
            margin-top: -80px;
            width: 1100px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            animation: fadeInUp 0.9s both 0.25s cubic-bezier(0.22, 0.61, 0.87, 1.27);
        }
        .care div{
            margin: 10px;
        }
        .care img{
            max-width: 100%;
            border-radius: 15px;
            box-shadow: 4px 4px 6px 0 rgba(0, 0, 0, 0.1);
        }
        a {
            color: #1c1c1c;
            text-decoration: none;
        }
        .careMain{
            background-image: url("/assets/img/careback.jpg");
            width: 1920px;
            height: 400px;
        }
        .careMain div{
            display: flex;
            justify-content: center;

        }
        .careMain a{
            margin-top: 80px;
            font-size: 34px;
            text-align: center;

        }
        .careMain a strong{
            color: #fff;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header1.jsp"></jsp:include>
<div class="careMain">
<div><a href=""><strong>아직 준비중</strong></a></div>
</div>
<div class="care">
    <div><a href="/lowSugar" id="content1"><img src="/assets/img/저당식단.jpg"></a></div>
    <div><a href="#" id="content2"><img src="/assets/img/칼로리식단.jpg"></a></div>
    <div><a href="#" id="content3"><img src="/assets/img/알레르기식단.jpg"></a></div>
    <div><a href="#" id="content4"><img src="/assets/img/단백질식단.jpg"></a></div>
    <div><a href="#" id="content5"><img src="/assets/img/나만의식단.jpg"></a></div>
</div>
</body>
</html>
