<%--
  Created by IntelliJ IDEA.
  User: dnjs1
  Date: 24. 7. 19.
  Time: 오전 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body id="orderCart" class="hd sub">
<jsp:include page="../common/header.jsp"></jsp:include>
<div id="wrap">
    <main id="contents" class="hd__orderCart">
        <ul class="breadcrumb">
            <li>HOME</li>
            <li>장바구니</li>
        </ul>
        <div class="orderCart hd__inner1100">
            <h2 id="cartTitleGT" class="hd__page-title">장바구니</h2>
            <a id="cartBtnGt" class="hd__page-title__btn-link" style="display: none;">그리팅 장바구니</a>
            <section class="orderCart__sec">
                <ul class="tab-menu clearfix col3" id="carttab">
                    <li class="tab-menu__list tab-menu__list--on disabled" data-tab="cartOriginal" id="cartOriginal"><a>
                        <span id="originalTab">일반(0)</span></a></li>
                    <li class="tab-menu__list disabled" data-tab="cartGift" id="cartGift">
                        <a><span id="giftTab">선물(0)</span></a></li>
                </ul>
                <div id="orderCartTop" class="orderCart__top" style="display: none;">
                    <div class="orderCart__top__ctrl" id="allDiv">
                        <span class="checks">
                            <input type="checkbox" name="all" id="checkall" checked="">
                            <label class="form-label" for="checkall">전체선택</label></span>
                        <div class="btn__delete">
                            <a class="btn-round" id="dvShippingTypeSelectCart" style="display: none;">선물주문 이동</a>
                            <a class="btn-round" id="dvDelSelectCart">선택삭제</a>
                        </div>
                    </div>
                    <div id="giftType10" class="orderCart__top__gift accordion" style="display: none;"><a
                            href="https://www.greating.co.kr/order/orderCart" class="gift-link"></a>
                        <div class="accordion__head" id="giftType10Smr"></div>
                        <div class="accordion__cont">
                            <div class="gift-box">
                                <div class="gift-info">
                                    <div class="gift-info__price">
                                        <p><span id="giftType10CtgryNm"></span> 선택 상품 금액 </p>
                                        <span class="price" id="giftType10Payment"></span>
                                    </div>
                                    <div class="gift-info__text">
                                        <strong id="giftType10ArlY"></strong>
                                        <p id="giftType10ArlN"></p>
                                    </div>
                                </div>
                                <div class="gift-list" id="giftType10Item"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="none-list">
                    <div class="none-list__inner"><p class="none-list__txt">장바구니에 담긴 상품이 없습니다.</p>
                    </div>
                    <a class="btn__goHome" id="goHome" href="/">홈으로</a></div>
            </section>
        </div>
    </main>
</div>
</body>
</html>
