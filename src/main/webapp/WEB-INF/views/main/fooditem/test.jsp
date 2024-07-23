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
<div class="orderCart__list">
    <ul class="orderCart__title">
        <li>제품정보</li>
        <li>판매금액</li>
        <li>수량</li>
        <li>구매금액</li>
    </ul>
    <ul class="box" id="dvCartListArea">
        <!-- dvCartDetlSingleTemplate -->
        <!-- dvCartDetlMultiTemplate -->
        <li class="orderCartBox__list single  ">
            <div class="orderCartBox__list__inner">
                <input type="hidden" name="dvItemId" id="dvItemId_127565" value="127565">
                <input type="hidden" name="dvItemOptnDetlId" value="202922">
                <input type="hidden" name="dvItemOptnDetlName" value="보양추어탕 550g">
                <input type="hidden" name="dvRegularPeriod" value="">
                <input type="hidden" name="dvCartPrice" id="dvCartPrice_13016115" value="7650">
                <input type="hidden" name="dvCartId" id="dvCartId_13016115" value="13016115">
                <input type="hidden" name="dvCartDetlPrice" id="dvCartDetlPrice_16453040" value="7650">
                <input type="hidden" name="dvCartDetlId" id="dvCartDetlId_16453040" value="16453040">
                <input type="hidden" name="dvItemName" id="dvItemName_보양 추어탕 550g" value="보양 추어탕 550g">
                <input type="hidden" name="dvMenuType" id="dvMenuType" value="5">
                <input type="hidden" name="dvCtgryName" id="dvCtgryName_국" value="진한 국/찌개/국">

                <input type="hidden" name="dvQty" id="dvQty_1" value="1">
                <input type="hidden" name="dvTotalPrice" id="dvTotalPrice_16453040" value="7650">
                <input type="hidden" name="dvCtgryNameCust" id="dvCtgryNameCust_국" value="건강마켓 / 진한 국&amp;찌개 / 국">
                <input type="hidden" name="dvMARKET_PRICE" id="dvMARKET_PRICE_13016115" value="9000">
                <input type="hidden" name="dvMARKET_GP_PRICE" id="dvMARKET_GP_PRICE_13016115" value="7650">
                <!-- 상품선택 체크박스 -->
                <div class="checkBoxAll">
				<span class="checks">
					<!-- 판매중단 / 일시품절 / 판매중단인 경우 비노출 -->
					<input type="checkbox" id="prdSelect16453040" name="all" title="상품선택" onclick="checkPrdSelect('1','16453040');" class="dvCartDetlId" value="16453040" data-item-list="" checked="checked" data-menutype="5" data-urcompanyid="1">
					<label for="prdSelect16453040"></label>
				</span>
                </div>
                <!--// 상품선택 체크박스 -->
                <!-- 아이템 박스 -->
                <div class="orderCartBox__list__cont">
                    <figure class="cont__img">
                        <a href="/market/marketDetail?itemId=127565" id="prdImg13016115"><img src="https://image.greating.co.kr/IL/item/202206/21/B_037EE1DC9AAC44E5B8C93FEEBFD663BC.jpg" alt="보양 추어탕 550g" onerror="this.src='/front_mo/images/@120x110.jpg'"></a>
                    </figure>
                    <div class="cont__text">
                        <a href="/market/marketDetail?itemId=127565"><strong class="cont__title">보양 추어탕 550g</strong></a>
                    </div>
                </div>
                <span class="selling-price price01">9,000원</span>
                <div class="prd_value">
					<span class="prd_length">
						<input type="text" min="1" maxlength="5" class="dvCartDetlQty" onkeydown="return fnNumCheck(event)" id="dvCartDetlQty_16453040" name="16453040" value="1" oldqty="1" companytype="" stock="69" preordercnt="0" preorderyn="" numberonly="">
						<button type="button" class="btn_st1_plus">수량 감소</button>
						<button type="button" class="btn_st1_minus">수량 증가</button>
					</span>
                    <span class="discount-tooltip bottom qtyDcToolTip_127565 hide"></span>
                </div>
                <span class="selling-price price02">
						7,650원
				</span>
                <button type="button" class="btn__list-delete dvDelCartDetl">
                    <span class="hidden">삭제</span>
                </button>
            </div>
            <!-- //아이템 박스 -->
        </li>
        <li class="orderCartBox__list single  ">
        <div class="orderCartBox__list__inner">
            <!-- 상품선택 체크박스 -->
            <div class="checkBoxAll">
				<span class="checks">
					<!-- 판매중단 / 일시품절 / 판매중단인 경우 비노출 -->
					<input type="checkbox" id="prdSelect16453009" name="all" title="상품선택" onclick="checkPrdSelect('1','16453009');" class="dvCartDetlId" value="16453009" data-item-list="" checked="checked" data-menutype="5" data-urcompanyid="1">
					<label for="prdSelect16453009"></label>
				</span>
            </div>
            <!--// 상품선택 체크박스 -->
            <!-- 아이템 박스 -->
            <div class="orderCartBox__list__cont">
                <figure class="cont__img">
                    <a href="/market/marketDetail?itemId=148732" id="prdImg13016114"><img src="https://image.greating.co.kr/IL/item/202403/11/B_BEA782F43ED948E087217B5BDB4C801C.jpg" alt="사골 국밥 265g" onerror="this.src='/front_mo/images/@120x110.jpg'"></a>
                </figure>

                <div class="cont__text">

                    <a href="/market/marketDetail?itemId=148732"><strong class="cont__title">사골 국밥 265g</strong></a>
                    <p class="cont__desc">
                        <!-- 배송 예정일 미노출 시 삭제 -->
                    </p>
                </div>
            </div>
            <span class="selling-price price01">6,500원</span>
            <div class="prd_value">
					<span class="prd_length">
						<input type="text" min="1" maxlength="5" class="dvCartDetlQty" onkeydown="return fnNumCheck(event)" id="dvCartDetlQty_16453009" name="16453009" value="1" oldqty="1" companytype="" stock="196" preordercnt="0" preorderyn="" numberonly="">
						<button type="button" class="btn_st1_plus">수량 감소</button>
						<button type="button" class="btn_st1_minus">수량 증가</button>
					</span>
                <span class="discount-tooltip bottom qtyDcToolTip_148732 hide"></span>
            </div>
            <span class="selling-price price02">5,200원</span>
            <button type="button" class="btn__list-delete dvDelCartDetl">
                <span class="hidden">삭제</span>
            </button>
        </div>
        <!-- //아이템 박스 -->
    </li></ul>
</div>
</body>

</html>
