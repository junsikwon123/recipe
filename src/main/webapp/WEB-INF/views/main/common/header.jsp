<%--
  Created by IntelliJ IDEA.
  User: dnjs1
  Date: 24. 7. 4.
  Time: 오후 5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>파이널</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/assets/bootstrap/css/header.css">
    <link rel="stylesheet" href="/assets/css/header.css">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<style>
    #header {
        border: 1px solid #e6e7e8;
    }

    * {
        font-family: 'Noto Sans KR';
        font-weight: 500;
    }

    #bodyImg {
        position: relative;
        z-index: 0;
        height: 500px;
        overflow: hidden;
    }

    #bodyList {
        position: absolute;
        height: 50px;
        right: 250px;
        top: 50px;
    }

    a {
        text-decoration: none;
        color: gray;
    }

    li {
        list-style: none;
    }
</style>
<script>
    $(document).ready(function() {
        let curUrl = window.location.href;
        if (curUrl === "http://localhost/") {
            console.log("루트페이지")
            $('#mainBodyImg').css('display', 'block');
        } else  {
            console.log("루트페이지아님")
            $('#mainBodyImg').css('display', 'none');
        }
    });
    function commonSearch(value, event) {
        if (event.keyCode === 13) {
            if (window.find(value)) { // 찾고자 하는 결과가 현재 페이지에 있으면 강조표시하고 함수 종료
                return
            } else {
                // $.ajax({
                // })
            }

        }
    }

    let i = 1
    setInterval(() => {
        setTimeout(() => {
            $(`#mainImg${i}`).css('display', 'block')
        }, 5000);
        $(`#mainImg${i}`).css('display', 'none')
        if (i < 6) {
            i++
        } else {
            i = 1
        }
    }, 2500);
    let imgInput = $('#imgInput')

    $('#img1').hover(function () {
        $('#img1').css('border', '2px solid cornflowerblue')
        imgInput.empty()
        imgInput.append('<img src="/uploadedImg/main/MainPage/반짝세일.png">')
    }, function () {
        $('#img1').css('border', '')
    })

    $('#img2').hover(function () {
        $('#img2').css('border', '2px solid cornflowerblue')
        imgInput.empty()
        imgInput.append('<img src="/uploadedImg/main/MainPage/삼성.jpg">')
    }, function () {
        $('#img2').css('border', '')
    })

    $('#img3').hover(function () {
        $('#img3').css('border', '2px solid cornflowerblue')
        imgInput.empty()
        imgInput.append('<img src="/uploadedImg/main/MainPage/카누.jpg" alt="">')
    }, function () {
        $('#img3').css('border', '')
    })
    $('#img4').hover(function () {
        $('#img4').css('border', '2px solid cornflowerblue')
        imgInput.empty()
        imgInput.append('<img src="/uploadedImg/main/MainPage/홈스타일.png" alt="">')
    }, function () {
        $('#img4').css('border', '')
    })

    $('#img5').hover(function () {
        $('#img5').css('border', '2px solid cornflowerblue')
        imgInput.empty()
        imgInput.append('<img src="/uploadedImg/main/MainPage/쿠폰.jpg" alt="">')
    }, function () {
        $('#img5').css('border', '')
    })

    $('#img6').hover(function () {
        $('#img6').css('border', '2px solid cornflowerblue')
        imgInput.empty()
        imgInput.append('<img src="/uploadedImg/main/MainPage/칠성.jpg" alt="">')
    }, function () {
        $('#img6').css('border', '')
    })
    $(document).ready(function() {
        $('#searchInput2').focus(function() {
            $(this).attr('placeholder', '검색어를 입력해 주세요.');
        }).blur(function() {
            $(this).attr('placeholder', '2주도 안남음. 일해라 핫산!');
        });
    });
</script>
<body id="main" class="hd">
<div id="wrap">
    <header id="header" class="hd__header">
        <div class="header">
            <section class="user-area">
                <ul class="user-area__menu">
                    <%--로그인 클릭--%>
                    <sec:authorize access="isAnonymous()">
                        <li><a href="/member/login">로그인</a></li>
                        <li><a href="/joinfrm">회원가입</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <span><sec:authentication property="name"/></span>님 환영합니다
                        <li><a href="/member/logout">로그아웃</a></li>
                        <sec:authorize access="hasRole('ADMIN')">
                            <li><a href="/main">관리자 페이지</a></li>
                        </sec:authorize>
                    </sec:authorize>
                    <%--회원가입 클릭--%>
                    <%--배송정보 클릭--%>
                    <li><a href="#">배송정보</a></li>
                    <%--고객센터 클릭--%>
                    <li><a href="/customer/center">고객센터 </a>
                </ul>
            </section>
            <div class="header__inner">
                <div class="header__sec">
                    <h1 class="logo">
                        <a href="/">
                            <img src="/uploadedImg/main/img_header_logo.png" alt=""><%--추후 제목 이미지 넣어야함--%>
                        </a>
                    </h1>
                    <div class="menu">
                        <a class="on" href="/">건강마켓</a><a href="/careMain">식단관리</a>
                    </div>
                    <nav class="direct">
                        <div class="direct__search btn__modal-open" data-login="y" id="searchPopup"
                             data-popup-name="popup_search" style="margin-bottom: 10px;">
                            <input type="text"
                                   style="height: 50px"
                                   id="searchInput2"
                                   class="search-input"
                                   placeholder="2주도 안남음. 일해라 핫산!"
                                   autocomplete="off"
                                   onkeypress="commonSearch(this.value, event)"> <%--추후 input 창 출력 클릭 이벤트 --%>
                            <button type="button" class="direct__search-remove" style="display: none;">지우기</button>
                            <a class="btn__modal-open" data-login="n" data-popup-name="popup_search">검색</a></div>

                        <%--내정보 클릭--%>
                        <a href="/cart/test">
                            <img src="/uploadedImg/main/스크린샷 2024-07-04 163834.png" width="69" height="66">
                        </a>
                        <%--레시피 글쓰기 클릭--%>
                        <a>
                            <img src="/uploadedImg/main/스크린샷%202024-06-27%20171241.png?h=9f0eff141daebd0b04983e61b2ea4b97"
                                 width="72" height="75" style="margin-bottom: -2px;margin-top: -11px;">
                        </a>
                        <a class="direct__heart"> <img id="heartIMG"></a>
                        <a href="/cart/main" class="direct__cart"> <span id="cartCnt">0</span>
                            <img src="/uploadedImg/main/icon_header_cart.png?h=b0cf2eaea34afb39f82041851f5691b1"
                                 alt="장바구니"></a>
                    </nav>
                </div>
                <div class="gnb">
                    <div class="gnb__inner">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <%--식자재 링크--%>
                                <li class="gnb__list"><a id="headCardLink" class="gnb__list-name" href="/fooditem/main">식자재</a>
                                </li>
                                <%--랭킹 링크--%>
                                <li class="gnb__list"><a class="gnb__list-name main_tab" href="/fooditem/ranking">베스트</a></li>
                                <%--분류 링크--%>
                                <li class="gnb__list"><a class="gnb__list-name main_tab" href="/recipe/main">분류</a></li>
                                <%--물물교환 링크--%>
                                <li class="gnb__list"><a class="gnb__list-name main_tab" href="/trade/main">물물교환</a>
                                </li>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main id="mainBodyImg" style="border: 5px solid #77b347;">
        <div id="bodyImg">
            <div id="imgInput" style="width: 2000px;">
                <img id="mainImg1" src="/uploadedImg/main/MainPage/반짝세일.png" style="display: none;">
                <img id="mainImg2" src="/uploadedImg/main/MainPage/삼성.jpg" style="display: none;">
                <img id="mainImg3" src="/uploadedImg/main/MainPage/카누.jpg" style="display: none;">
                <img id="mainImg4" src="/uploadedImg/main/MainPage/홈스타일.png" style="display: none;">
                <img id="mainImg5" src="/uploadedImg/main/MainPage/쿠폰.jpg" style="display: none;">
                <img id="mainImg6" src="/uploadedImg/main/MainPage/칠성.jpg" style="display: none;">
            </div>
            <div id="bodyList" style="display: flex; flex-direction: column;">
                <a href="https://pages.coupang.com/p/117380?from=home_C1&traid=home_C1&trcid=67673799965" id="img1"><img
                        src="/uploadedImg/main/MainPage/k뷰티.jpg" alt=""></a>
                <a href="https://pages.coupang.com/f/s1956?from=home_C1&traid=home_C1&trcid=11380937" id="img2"><img
                        src="/uploadedImg/main/MainPage/삼성tv 보상.jpg" alt=""></a>
                <a href="https://pages.coupang.com/f/s50394?from=home_C1&traid=home_C1&trcid=11380944" id="img3"><img
                        src="/uploadedImg/main/MainPage/canu.jpg" alt=""></a>
                <a href="https://pages.coupang.com/p/102665?from=home_C1&traid=home_C1&trcid=67673800401" id="img4"><img
                        src="/uploadedImg/main/MainPage/homestyle.png" alt=""></a>
                <a href="https://login.coupang.com/login/login.pang?rtnUrl=https%3A%2Fmc.coupang.com%2Fssr&from=home_C1&traid=home_C1&trcid=67673800816"
                   id="img5"><img src="/uploadedImg/main/MainPage/coupon.jpg" alt=""></a>
                <a href="https://pages.coupang.com/f/s264096?from=home_C1&traid=home_C1&trcid=11378725" id="img6"><img
                        src="/uploadedImg/main/MainPage/chilsung.jpg" alt=""></a>
            </div>
        </div>
    </main>
</div>

</body>
</html>
