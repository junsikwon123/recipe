<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 31.
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
    <jsp:include page="../common/header.jsp"></jsp:include>
</header>
<style>
    .myPageCgSort:hover {
        background-color: #77b347;
        color: white;
    }
</style>
<script>

</script>
<h1 style="font-size: large; margin-top: 10px; margin-left: 400px">HOME > 마이페이지 > 주문/배송 조회*변경</h1>
<main style="display: flex; flex-direction: row">
    <aside style="width: 10%; margin-top: 60px; margin-left: 400px">
        <p style="font-size: xx-large; font-weight: bold">마이페이지</p>
        <hr style="border: 2px solid #77b347">
        <p style="font-weight: bold">나의 쇼핑 내역</p>
        <a href="#">주문/배송 조회*변경</a><br>
        <a href="#">취소/교환/반품 조회</a><br>
        <a href="#">일자별 배송상품 조회</a><br>
        <a href="#">구독 관리</a><br>
        <hr>
        <p style="font-weight: bold">나의 혜택관리</p>
        <a href="#">나의 포인트</a><br>
        <a href="#">나의 쿠폰</a><br>
        <a href="#">나의 기프트카드</a><br>
        <hr>
        <p style="font-weight: bold">나의 커뮤니티</p>
        <a href="#">1:1 문의 내역</a><br>
        <a href="#">나의 상품리뷰</a><br>
        <a href="#">BEST 리뷰 라운지</a><br>
        <a href="#">나의 상품문의</a><br>
        <a href="#">고객의 소리</a><br>
        <hr>
        <p style="font-weight: bold">회원정보</p>
        <a href="#">회원정보 수정</a><br>
        <a href="#">마케팅 수신 동의 설정</a><br>
        <a href="#">배송지 관리</a><br>
        <a href="#">H.Point Pay 관리</a><br>
        <a href="#">그리팅페이 관리</a><br>
        <a href="#">로그인 기록 관리</a><br>
        <a href="#">회원 탈퇴</a><br>
    </aside>
    <section style="margin-left: 50px; margin-top: 50px; width: 900px; display: flex; flex-direction: column">
        <div style="display: flex; flex-direction: row">
            <table>
                <tr>
                    <th><button type="button" class="myPageCgSort" style="width: 300px; height: 60px">쇼핑내역</button></th>
                    <th><button type="button" class="myPageCgSort" style="width: 300px; height: 60px">혜택*이벤트</button></th>
                    <th><button type="button" class="myPageCgSort" style="width: 300px; height: 60px">헬스케어</button></th>
                </tr>
            </table>
        </div>
        <hr>
    </section>
</main>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
</body>
</html>
