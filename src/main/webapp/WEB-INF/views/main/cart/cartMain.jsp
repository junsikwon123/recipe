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

<script>
    window.onload = () => {
        const noneList = document.querySelector('.none-list');
        const onList = document.querySelector(".orderCart__list");
        const allList = document.getElementById("orderCartTop");
        if ("${count}" === "0") {
            noneList.style.display = "block";
            onList.style.display = "none";
        } else {
            allList.style.display = "block";
        }
    }
</script>
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
                        <span id="originalTab">일반(${count})</span></a></li>
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
                <div style="width: 1100px; margin: 0 auto">
                    <div class="orderCart__list">
                        <ul class="orderCart__title">
                            <li>제품정보</li>
                            <li>판매금액</li>
                            <li>수량</li>
                            <li>구매금액</li>
                        </ul>
                        <ul class="box" id="dvCartListArea">
                            ${caList}
                            <li class="orderCartBox__list single">
                                <div class="orderCartBox__list__inner">
                                    <input type="hidden" name="dvItemId" value="f_num"><%--f_num--%>
                                    <input type="hidden" name="dvItemName" value="보양추어탕 550g"><%--f_name--%>
                                    <input type="hidden" name="dvItemPrice" value="f_price*(count=<f_count)"><%--f_price--%>
                                    <input type="hidden" name="dvCartId" value="ca_num"><%--ca_num 주문 완료시  삭제--%>
                                    <input type="hidden" name="dvItemcount" value="f_count"><%--인벤 최대 갯수--%>
                                    <!-- 상품선택 체크박스 -->
                                    <div class="checkBoxAll">
				                        <span class="checks">
					                    <!-- 판매중단 / 일시품절 / 판매중단인 경우 비노출 -->
					                        <input type="checkbox" id="prdSelect16453040" name="all" title="상품선택"
                                                   checked="checked">
                                                <label for="prdSelect16453040"></label>
				                        </span>
                                    </div>
                                    <!--// 상품선택 체크박스 -->
                                    <!-- 아이템 박스 -->
                                    <div class="orderCartBox__list__cont">
                                        <figure class="cont__img">
                                            <a href="/fooditem/detail?f_num=+(f_num)">
                                                <img src="https://image.greating.co.kr/IL/item/202206/21/B_037EE1DC9AAC44E5B8C93FEEBFD663BC.jpg">
                                            </a>
                                        </figure>
                                        <div class="cont__text">
                                            <a href="/fooditem/detail?f_num=+(f_num)">
                                                <strong class="cont__title">c_name + f_title</strong>
                                            </a>
                                        </div>
                                    </div>
                                    <span class="selling-price price01">f_price원</span>
                                    <div class="prd_value">
                                        <span class="prd_length">
                                            <input type="text" min="1" maxlength="5" class="dvCartDetlQty"
                                                   value="f_count">
                                            <button type="button" class="btn_st1_plus">수량 감소</button>
                                            <button type="button" class="btn_st1_minus">수량 증가</button>
                                        </span>
                                        <span class="discount-tooltip bottom qtyDcToolTip_127565 hide"></span>
                                    </div>
                                    <span class="selling-price price02">f_count * f_price</span>
                                    <button type="button" class="btn__list-delete dvDelCartDetl">
                                        <span class="hidden">삭제</span>
                                    </button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="none-list" style="display: none">
                    <div class="none-list__inner"><p class="none-list__txt">장바구니에 담긴 상품이 없습니다.</p>
                    </div>
                    <a class="btn__goHome" id="goHome" href="/">홈으로</a></div>
            </section>
        </div>
        <footer>
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </footer>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const dvList = document.getElementById("dvCartListArea");
                const check = document.getElementsByName("all");
                check.forEach(c => {
                    c.addEventListener("click", function () {
                        if (this.id === "checkall") {
                            if (this.checked === true) {
                                c.checked = true
                            } else {
                                c.checked = false
                            }
                        } else {
                            if (this.checked === false) {
                                check[0].checked = false
                            } else {
                                const allChecked = Array.from(check).slice(1).every(box => box.checked);
                                if (allChecked) {
                                    check[0].checked = true;
                                }
                            }
                        }
                    })
                })

                function registerDeleteButtons() {
                    console.log("감자")
                    const dvDelete = document.getElementsByClassName("dvDelCartDetl");
                    Array.from(dvDelete).forEach(d => {
                        d.removeEventListener('click', deleteHandler);
                        d.addEventListener('click', deleteHandler);
                    });
                }

                function deleteHandler() {
                    console.log(this)
                    const deleteDiv = this.closest(".orderCartBox__list__inner")
                    const deleteButton = deleteDiv.querySelector("input[name='dvCartId']")
                    $.ajax({
                        url: "/cart/deleteList?ca_num=" + deleteButton.value,
                        type: "get"
                    }).done(resp => {
                        dvList.innerHTML = resp
                        registerDeleteButtons();
                    }).fail(error => console.log(error))
                }

                const dvDeleteAll = document.getElementById("dvDelSelectCart");
                dvDeleteAll.addEventListener("click", () => {
                    let deleteAll = [];
                    Array.from(check).slice(1).forEach(e => {
                        if (e.checked === true) {
                            let deleteDiv = e.closest(".orderCartBox__list__inner")
                            let deleteNum = deleteDiv.querySelector("input[name='dvCartId']")
                            if (deleteNum) {
                                deleteAll.push(deleteNum.value);
                            }
                        }
                    })
                    $.ajax({
                        url: "/cart/deleteList?",
                        type: "get",
                        data: {ca_num: deleteAll}
                    }).done(resp => {
                        dvList.innerHTML = resp
                        registerDeleteButtons();
                    }).fail(error => console.log(error))
                    console.log("아...", deleteAll)
                })

                registerDeleteButtons();
            })

        </script>
    </main>
</div>
</body>
</html>
