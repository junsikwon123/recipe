<%--
  Created by IntelliJ IDEA.
  User: dnjs1
  Date: 24. 7. 10.
  Time: 오후 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
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
                                <%--------동기로 이미지 4장 가져와서 출력--------%>
                                ${img}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="info-area">
                    <h3 class="info-area__name">
                        <span class="strong">${c_name}&nbsp;${title}</span><span>원산지 :*상세페이지 참고</span>
                    </h3>
                    <sec:authorize access="hasRole('ADMIN')">
                        <button>수정</button>
                    </sec:authorize>
                    <div class="box"></div>
                    <div class="price">
                        <div class="price-discounted strong">${price}원</div>
                    </div>
                    <div class="info-area__box">
                        <div class="info-area__box-list" id="weight_line">
                            <div class="info-area__box-tit"><span>용량</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>${volume}</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-area__box-list" id="calorie_line">
                            <div class="info-area__box-tit"><span>칼로리</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>${cal}</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-area__box-list">
                            <div class="info-area__box-tit"><span>보관방법</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>${save}</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-area__box-list">
                            <div class="info-area__box-tit"><span>등록일</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>${date}</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="info-area__box-list">
                            <div class="info-area__box-tit"><span>판매자</span></div>
                            <div class="info-area__box-cont">
                                <div class="store">
                                    <div class="store-name"><span>관리자</span></div>
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
                        <li class="tab-menu__list tnb-area__list tab-menu__list--on">
                            <a href="javascript:void(0);" onclick="foodDetail(this,'foodInfo')">
                                <strong>상품정보</strong>
                            </a>
                        </li>
                        <li class="tab-menu__list tnb-area__list " id="reviewTab">
                            <a href="javascript:void(0);" onclick="foodDetail(this,'foodReview')">
                                <strong>상품리뷰</strong><span class="vreview-review-count tab-menu__count"
                                                           id="reviwCnt">29</span>
                            </a>
                        </li>
                        <li class="tab-menu__list tnb-area__list" data-tab="cont-inquiry">
                            <a href="javascript:void(0);" onclick="foodDetail(this,'foodInquiry')">
                                <strong>상품문의</strong></a><span class="tab-menu__count" id="qnaCnt">0</span>
                            </a>
                        </li>
                        <li class="tab-menu__list tnb-area__list" data-tab="cont-notice">
                            <a href="javascript:void(0);" onclick="foodDetail(this,'change')">
                                <strong>교환/반품</strong>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="tab-content cont-info tab-content--show tab-contents--current" id="cont-info">
                    <section class="detailInfo tab-content__sect">
                        <div style="display: flex; justify-content: center; align-items: center;">
                            ${info}
                        </div>
                    </section>
                </div>
            </section>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function foodDetail(obj,result) {
        const searchClass = document.getElementsByClassName("tab-menu__list--on");
        const addClass = obj.closest(".tab-menu__list");
        console.log("a..",addClass);
        const urlParams = new URLSearchParams(window.location.search);
        const fNum = urlParams.get("f_num");
        console.log("fNum",fNum);

        if (!addClass.classList.contains("tab-menu__list--on")) {
            // 모든 기존 tab-menu__list--on 클래스를 제거
            Array.from(searchClass).forEach(el => {
                el.classList.remove("tab-menu__list--on");
            });

            // 클릭한 요소의 부모 <li>에 클래스 추가
            addClass.classList.add("tab-menu__list--on");
        }
        $.ajax({
            type: 'get',
            url: "/fooditem/restDetail",
            data:{
                f_num: fNum, type:result
            }
        }).done(resp => {
            console.log("resp" , resp);
            $("#cont-info div").html(resp)
        }).fail(err => {
            console.log(err)
        });
    }
</script>

</body>
</html>
