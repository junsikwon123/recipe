<%--
  Created by IntelliJ IDEA.
  User: dnjs1
  Date: 24. 7. 5.
  Time: 오후 7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>로켓프레시</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/foodItemMain.css?h=3f30c2c47d7d23c7a994db0c862d45a5">
    <link rel="stylesheet" href="/assets/css/foodItemMain.css?h=f1d8140dea40b1c57559575c00adff25">
    <script src="../common/js/jquery-3.7.1.min.js"></script>

    <style>
        .srp-sync #searchSortingOrder .sorting-order-options li:after {
            content: ' ';
            display: block;
            clear: both;
        }

        .srp-sync #searchSortingOrder .sorting-order-options li.selected {
            font-weight: bold;
        }

        #searchSortingOrder .sorting-order-options li.selected {
            color: #0073e9;
        }

        .srp-sync #searchSortingOrder .sorting-order-options li {
            float: left;
            height: 100%;
            padding: 0 10px;
            line-height: 1.5;
            color: #555;
            border-left: 1px solid #eee;
        }


    </style>

</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div id="container" class="renewal sdp-wide list srp-sync srp-sync-brand">
    <section id="contents" class="contents list">
        <form id="searchOptionForm" action="https://www.coupang.com/np/categories/" method="get" data-linkcode="393760"
              data-unlimited="false" data-seo-page-tc="true" data-remove-params="false">
            <div class="newcx-container">
                <div class="newcx-body">
                    <div class="newcx-main">
                        <div class="newcx-widget-container">
                            <div class="newcx-top-multi-link-banner" data-web-log-event="expose" data-log-sent="1">
                                <img src="/assets/img/bannerunit_6611870e-8808-439b-905f-9f04c6ee9a2a.png?h=a6fd6576c3beddb2f65e9dceefc8b8d0">
                            </div>
                        </div>
                        <div class="newcx-list" data-search-id="1b49d3cefad242bd8585867217cf4c11">
                            <div class="newcx-main-category-header">
                                <div class="search-utilities">
                                    <div class="search-sorting">
                                        <div id="searchSortingOrder">
                                            <ul class="sorting-order-options">
                                                <li class="selected">
                                                    <input type="radio" id="sorter-salePriceAsc" name="sorter"
                                                           value="salePriceAsc" checked="">
                                                    <label for="sorter-salePriceAsc" class="item-name">낮은가격순</label>
                                                </li>
                                                <li class="">
                                                    <input type="radio" id="sorter-salePriceDesc" name="sorter"
                                                           value="salePriceDesc">
                                                    <label for="sorter-salePriceDesc" class="item-name">높은가격순</label>
                                                </li>
                                                <li class="">
                                                    <input type="radio" id="sorter-saleCountDesc" name="sorter"
                                                           value="saleCountDesc">
                                                    <label for="sorter-saleCountDesc" class="item-name">판매량순</label>
                                                </li>
                                                <li class="">
                                                    <input type="radio" id="sorter-latestAsc" name="sorter"
                                                           value="latestAsc">
                                                    <label for="sorter-latestAsc" class="item-name">최신순</label>
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearFix">
                            </div>
                            <ul id="productList" class="baby-product-list" style="margin-right: 0px;padding-left: 1px;">
                                ${list}
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="/fooditem/detail"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                                <li class="baby-product renew-badge">
                                    <a class="baby-product-link"
                                       href="https://www.coupang.com/vp/products/153523275?itemId=2700280021&amp;vendorItemId=70690630155&amp;sourceType=CATEGORY&amp;categoryId=393660"
                                       style="height: 466px;">
                                        <dl class="baby-product-wrap adjust-spacing " style="height: 444px;">
                                            <dt class="image">
                                                <img src="/assets/img/이미지 1.jpg"
                                                     width="100%" alt="프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개">
                                            </dt>
                                            <dd class="descriptions">
                                                <div class="badges"></div>
                                                <div class="name"> 프린스 에드워드 아일랜드 블렌드 (냉동), 1kg, 2개</div>
                                                <div class="price-area ">
                                                    <div class="price-wrap">
                                                        <div class="price">
                                                            <strong class="price-value"
                                                                    style="font-size: 15px">19,900</strong>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="other-info">
                                                    <div class="rating-star"><span class="star">
                                                    <em class="rating" style="width: 70%;">5.0</em></span>
                                                        <span class="rating-total-count">(5384)</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </a>
                                </li>
                            </ul>
                            <%--식자재 미리보기 --%>
                            <div class="clearFix"></div>
                        </div>
                    </div>
                    <div class="newcx-nav">
                        <div class="newcx-search-filter search-filter" style="margin-top: 1px;">
                            <div class="filter-content" style="display: block;">
                                <div class="search-filter-options search-category-component"><h5>카테고리</h5>
                                    <div id="searchCategoryComponent" class="search-filter-option-list">
                                        <ul class="search-option-items">
                                            ${cList}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
</script>
<script>
    const searchRadio = document.querySelectorAll('.sorting-order-options input[type="radio"]');
    searchRadio.forEach(radio => {
        radio.addEventListener('click', () => {
            const searchLi = document.querySelectorAll('.sorting-order-options li');
            console.log(radio.value)
            searchLi.forEach(li => {
                li.classList.remove('selected');
                li.querySelector('input[type="radio"]').checked = false;
            });

            //현재 클릭된 라디오 버튼의 부모 li 요소에 selected 클래스 추가하고 checked 속성을 true로 설정
            const parentLi = radio.parentElement;
            parentLi.classList.add('selected');
            radio.checked = true;
            $.ajax({
                type: 'get',
                url: "/fooditem/order?order=" + radio.value
            }).done((resp) => {
                console.log("resp:", resp);
                $("#productList").html(resp)
            }).fail((err) => console.log(err))
        });
    });

    function searchctg(c_num) {
        $.ajax({
            method: "post",
            url: "fooditem/searchctg?c_num=" + c_num
        }).done((resp) > {}).fail((err) => console.log(err))
    }

    document.addEventListener("DOMContentLoaded", function () {
        // 'btn-fold' 클래스를 가진 모든 요소를 가져오기
        const foldButtons = document.querySelectorAll(".btn-fold");

        // 각 버튼에 클릭 이벤트 리스너 추가
        foldButtons.forEach(button => {
            button.addEventListener("click", function (event) {
                // 링크의 기본 동작을 막기
                event.preventDefault();

                // 버튼의 부모 요소를 가져오기 위해 closest 사용
                const listItem = this.closest(".search-option-item");
                // 이 리스트 아이템 내의 자식 ul 요소 찾기
                const childUl = listItem.querySelector(".search-option-items-child");
                // 자식 ul 요소의 클래스 이름을 콘솔에 출력
                console.log(childUl.className);

                // 자식 ul 요소의 display 속성을 토글 및 클래스 추가/제거
                if (childUl.style.display === "block") {
                    childUl.style.display = "none";
                    listItem.classList.remove('selected', 'opened');
                    console.log(listItem.className);
                    this.classList.remove('on'); // 선택 사항: 버튼 스타일링을 위한 'on' 클래스 토글
                } else {
                    childUl.style.display = "block";
                    listItem.classList.add('selected', 'opened');
                    console.log(listItem.className);
                    this.classList.add('on'); // 선택 사항: 버튼 스타일링을 위한 'on' 클래스 토글
                }
            });
        });
    });

</script>
</body>
</html>
