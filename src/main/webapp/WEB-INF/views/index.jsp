<%--
  Created by IntelliJ IDEA.
  User: dnjs1
  Date: 24. 7. 4.
  Time: 오후 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>그리팅몰</title>
    <link rel="icon" href="/uploadedImg/main/MainPage/그리팅%20메인.jfif" type="image/jfif">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        #bodyWasteTitle:hover {
            color: #77b347;
        }

        .isHoverZoom:hover {
            transform: scale(1.3);
            transition: transform 0.7s;
        }

        .isHoverZoom {
            transform: scale(1.0);
            transition: transform 0.7s;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="./main/common/header.jsp"></jsp:include>
</header>
<main>
    <div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/uploadedImg/main/MainPage/구매스탬프.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/바이오랜드.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/식단마스터.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/쿠폰.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/한솔냉면.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/해일찍여름.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/급상승%20키워드.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/제주%20고당도%20감귤.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/MainPage/천중도%20복숭아.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div style="margin-left: 400px; width: 1100px; margin-top: 100px">
        <h4 style="color: gray">건강은 밥상으로부터</h4>
        <a href="#" style="color: black"><h2 id="bodyWasteTitle" style="font-weight: bold;">그리팅이 자신있게 추천드려요 <i
                class="main__ico v2">SALE</i></h2></a>
        <div style="display: flex; flex-direction: row">
            <div class="isHoverDiv" style="width: 500px; display: flex; flex-direction: column">
                <a href="#" style="overflow:hidden;">
                    <img class="isHoverZoom" src="/uploadedImg/main/통삼겹수육.jpg" style="width: 500px">
                </a>
                <h4 style="color: gray">집에서 즐기는 부드러운 수육 한상</h4>
                <h3 style="color: black; font-weight: bold">통삼겹 수육&찍먹소스 580g</h3>
                <a href="#" style="display: flex; flex-direction: row">
                    <h2 style="color: red; font-weight: bold; margin-right: 10px">10%</h2>
                    <h2 style="color: black; font-weight: bold; margin-right: 10px">19,800원 </h2>
                    <h2 style="color: lightgray; text-decoration: line-through; margin-right: 10px">22,000원</h2>
                    <button>담기</button>
                    <button>선물</button>
                </a>

            </div>
            <div style="width: 550px; margin-left: 50px; display: flex; flex-direction: column">
                <div style="display: flex; flex-direction: row; margin-bottom: 20px" class="isHoverDiv">
                    <a style="overflow:hidden;">
                        <img class="isHoverZoom" src="/uploadedImg/main/마늘장아찌.jpg" style="height: 200px">
                    </a>
                    <div style="display: flex; flex-direction: column; width: 330px; margin-top: 30px; margin-left: 20px">
                        <h5>유기농 의성 마늘의 알싸한 맛</h5>
                        <h4 style="font-weight: bold; color: black">[명인명촌] 이정하 유기농 마늘 장아찌 250g</h4>
                        <h6 style="text-decoration: line-through; color: gray">13000원</h6>
                        <h4 style="color: black; font-weight: bold"><span
                                style="color: red; font-weight: bold">10% </span> 11,700원<span
                                style="margin-left: 50px"><button>담기</button><span style="margin-left: 20px"><button>선물</button></span></span>
                        </h4>
                    </div>
                </div>
                <div style="display: flex; flex-direction: row; margin-bottom: 20px">
                    <a style="overflow: hidden">
                        <img class="isHoverZoom" src="/uploadedImg/main/고등어조림.jpg" style="height: 200px">
                    </a>
                    <div style="display: flex; flex-direction: column; width: 330px; margin-top: 30px; margin-left: 20px">
                        <h5>씹기 편한 고단백 식사</h5>
                        <h4 style="font-weight: bold; color: black">[소프트프로틴] 뼈까지 먹는 고등어조림 180g</h4>
                        <h6 style="text-decoration: line-through; color: gray">6,500원</h6>
                        <h4 style="color: black; font-weight: bold"><span
                                style="color: red; font-weight: bold">10% </span> 5,850원<span
                                style="margin-left: 50px"><button>담기</button><span style="margin-left: 20px"><button>선물</button></span></span>
                        </h4>
                    </div>
                </div>
                <div style="display: flex; flex-direction: row; margin-bottom: 20px">
                    <a style="overflow:hidden;">
                        <img class="isHoverZoom" src="/uploadedImg/main/하얀고추짬뽕.jpg" style="height: 200px">
                    </a>
                    <div style="display: flex; flex-direction: column; width: 330px; margin-top: 30px; margin-left: 20px">
                        <h5>익산 중식 노포 맛집 신동양</h5>
                        <h4 style="font-weight: bold; color: black">[모두의맛집] 하얀고추짬뽕 (2인분) 740g</h4>
                        <h6 style="text-decoration: line-through; color: gray">13,900원</h6>
                        <h4 style="color: black; font-weight: bold"><span
                                style="color: red; font-weight: bold">30% </span> 9,730원<span
                                style="margin-left: 50px"><button>담기</button><span style="margin-left: 20px"><button>선물</button></span></span>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel" style="margin-top: 100px; margin-left: 400px; width: 1100px;">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/uploadedImg/main/맞춤형건강식단.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/암환자체험판.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/6일챌린지.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/암환자.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/당뇨.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/건강.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/신장.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/uploadedImg/main/고혈압.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>
</main>
<br>
<br>
<br>
<br>

<footer>
    <jsp:include page="./main/common/footer.jsp"></jsp:include>
</footer>
</body>
</html>
