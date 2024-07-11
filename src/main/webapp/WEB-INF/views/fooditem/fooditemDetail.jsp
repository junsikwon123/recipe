<%--
  Created by IntelliJ IDEA.
  User: dnjs1
  Date: 24. 7. 10.
  Time: 오후 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>사골 국밥 265g :: 그리팅, 우리집 밥상주치의</title>
    <script src="/common/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script>
        $(document).ready(() => {
            $(".slick-track").slick({
                slidesToShow: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                infinite: true,
                arraw: true,
            });
        });
    </script>
</head>
<body id="marketDetail" class="hd">
<jsp:include page="../common/header.jsp"></jsp:include>
<div id="wrap">
    <main id="contents" class="hd__marketDetail">
        <ul class="breadcrumb">
            <li>HOME</li>
            <li>c_name(c_num2)</li>
            <li>c_name(c_num)</li>
        </ul>
        <div class="marketDetail hd__inner1100">
            <section class="marketDetail__sect hd__inner1100 overview"><h2 class="hidden">마켓상세 상품정보</h2>
                <div class="slider__sec" id="itemImageSlide">
                    <div class="slider slick-initialized slick-slider">
                        <div class="slick-list draggable">
                            <div class="slick-track" style="width: 100%;">
                                ------동기로 이미지 4장 가져와서 출력------
                                <div class="slick-slide">
                                    <div>
                                        <div class="slider__list" style="width: 100%;display: inline-block;">
                                            <figure>
                                                <img src="/assets/img/bannerunit_6611870e-8808-439b-905f-9f04c6ee9a2a.png"
                                                     alt="사골 국밥 265g">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="slick-slide">
                                    <div>
                                        <div class="slider__list" style="width: 100%;display: inline-block;">
                                            <figure>
                                                <img src="/assets/img/이미지 2.jpg"
                                                     alt="사골 국밥 265g">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="slick-slide">
                                    <div>
                                        <div class="slider__list" style="width: 100%;display: inline-block;">
                                            <figure>
                                                <img src="/assets/img/이미지 3.jpg"
                                                     alt="사골 국밥 265g">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="slick-slide">
                                    <div>
                                        <div class="slider__list" style="width: 100%;display: inline-block;">
                                            <figure>
                                                <img src="/assets/img/이미지 4.jpg"
                                                     alt="사골 국밥 265g">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="info-area">
                    <h3 class="info-area__name">
                        <span class="strong">c_name + f_volume</span><span>원산지 :*상세페이지 참고</span>
                    </h3>
                    <button>수정</button>
                    <div class="box"></div>
                    <div class="price">
                        <div class="price-discounted strong">f_price원</div>
                    </div>
                    <div class="info-area__box">
                        <div class="info-area__box-list" id="weight_line">
                            <div class="info-area__box-tit"><span>용량</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>f_volume</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-area__box-list" id="calorie_line">
                            <div class="info-area__box-tit"><span>칼로리</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>f_cal</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-area__box-list">
                            <div class="info-area__box-tit"><span>보관방법</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>f_save</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-area__box-list">
                            <div class="info-area__box-tit"><span>판매자</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>m_id</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <section class="btn-area">
                        <div class="btn">
                            <button class="btn-init orange dvMiniCartOpen" id="buttonCart">
                                장바구니 담기
                            </button>
                            <button class="btn-init green dvMiniCartOpen" id="buttonOrder">
                                구매하기
                            </button>
                        </div>
                    </section>
                </div>
            </section>
            <div class="vreview-summary-widget"></div>
            <section class="marketDetail__sect detail">
                <div class="tab-menu">
                    <%--버튼 --%>
                    <ul class="tab-menu__inner">
                        <li class="tab-menu__list tnb-area__list " data-tab="cont-info"><a
                                href="https://www.greating.co.kr/market/marketDetail?itemId=148732&amp;idx=1#"
                                class="active">
                            <strong>상품정보</strong></a></li>
                        <li class="tab-menu__list tnb-area__list tab-menu__list--on" data-tab="cont-review" id="reviewTab"><a
                                href="https://www.greating.co.kr/market/marketDetail?itemId=148732&amp;idx=1#"
                                class="active">
                            <strong>상품리뷰</strong><span class="vreview-review-count tab-menu__count" id="reviwCnt">29</span></a></li>
                        <li class="tab-menu__list tnb-area__list" data-tab="cont-inquiry"><a
                                href="https://www.greating.co.kr/market/marketDetail?itemId=148732&amp;idx=1#">
                            <strong>상품문의</strong></a><span class="tab-menu__count" id="qnaCnt">0</span></li>
                        <li class="tab-menu__list tnb-area__list" data-tab="cont-notice"><a
                                href="https://www.greating.co.kr/market/marketDetail?itemId=148732&amp;idx=1#">
                            <strong>교환/반품</strong></a>
                        </li>
                    </ul>
                </div>
                -----------------------------------여기서 부터 비동기------------------------------------------
                <div class="tab-content cont-info tab-content--show tab-contents--current" id="cont-info">
                    <section class="message tab-content__sect" style="display: none;"><p class="message__advice"></p>
                    </section>
                    <section class="detailInfo tab-content__sect">
                        <div style="display: flex; justify-content: center; align-items: center;">
                            상품내용
                        </div>
                    </section>
                </div>
            </section>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
