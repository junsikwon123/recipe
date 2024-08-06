<%--
  Created by IntelliJ IDEA.
  User: dnjs1
  Date: 24. 7. 19.
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Slick Carousel 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Slick Carousel CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">

<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css?h=cb606d99bb2418df19b6bc818b41e412">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
<link rel="stylesheet" href="/assets/css/styles.min.css?h=94c76ca45cf1136042bce4cad72a7b5e">
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
<script src="/assets/js/header.js"></script>
<script>
    $(document).ready(() => {
        $(".slick-track").slick({
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            infinite: true,
            arrows: true,
        });
    });
</script>
<body>
<h1>test</h1>

<div class="slick-track" style="width: 100%;">
    <div class="slick-slide">
        <div>
            <div class="slider__list" style="width: 100%;display: inline-block;">
                <figure><img src="/uploadedImg/fooditem/1722930023829.png"></figure>
            </div>
        </div>
    </div>
    <div class="slick-slide">
        <div>
            <div class="slider__list" style="width: 100%;display: inline-block;">
                <figure><img src="/uploadedImg/fooditem/1722930023899.png"></figure>
            </div>
        </div>
    </div>
    <div class="slick-slide">
        <div>
            <div class="slider__list" style="width: 100%;display: inline-block;">
                <figure><img src="/uploadedImg/fooditem/1722930023935.png"></figure>
            </div>
        </div>
    </div>
</div>
</body>
</html>
