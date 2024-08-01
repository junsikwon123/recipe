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

<body>

<jsp:include page="../common/header.jsp"></jsp:include>
<div style="width: 1100px; margin: 0 auto">
    <div class="orderCart__list">
        <ul class="orderCart__title">
            <li>제품정보</li>
            <li>판매금액</li>
            <li>수량</li>
            <li>구매금액</li>
        </ul>
        <ul class="box" id="dvCartListArea">
            <li class="orderCartBox__list single  ">
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
					<input type="checkbox" id="prdSelect16453040" name="all" title="상품선택" checked="checked">
					<label for="prdSelect16453040"></label>
				</span>
                    </div>
                    <!--// 상품선택 체크박스 -->
                    <!-- 아이템 박스 -->
                    <div class="orderCartBox__list__cont">
                        <figure class="cont__img">
                            <a href="/market/marketDetail?itemId=127565" id="prdImg13016115">
                                <img src="https://image.greating.co.kr/IL/item/202206/21/B_037EE1DC9AAC44E5B8C93FEEBFD663BC.jpg">
                            </a>
                        </figure>
                        <div class="cont__text">
                            <a href="/market/marketDetail?itemId=127565">
                                <strong class="cont__title">c_name + f_title</strong>
                            </a>
                        </div>
                    </div>
                    <span class="selling-price price01">f_price원</span>
                    <div class="prd_value">
					<span class="prd_length">
						<input type="text" min="1" maxlength="5" class="dvCartDetlQty" value="f_count">
						<button type="button" class="btn_st1_plus">수량 감소</button>
						<button type="button" class="btn_st1_minus">수량 증가</button>
					</span>
                        <span class="discount-tooltip bottom qtyDcToolTip_127565 hide"></span>
                    </div>
                    <span class="selling-price price02">
						f_count * f_price
				</span>
                    <button type="button" class="btn__list-delete dvDelCartDetl">
                        <span class="hidden">삭제</span>
                    </button>
                </div>
                <!-- //아이템 박스 -->
            </li>
        </ul>
    </div>
</div>
<footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
</body>
</html>
