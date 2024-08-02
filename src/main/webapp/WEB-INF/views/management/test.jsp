<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script>
    $(() => {
        let a = $('.dvCartDetlId')
        let b = document.querySelectorAll('.boxInner__txt')
        console.log(a[0].value)
        console.log(b[0].innerHTML)
        console.log(b[1].innerHTML)
        let c = a[0].value+", "+b[0].innerHTML
        console.log(c)
        let c_seperate = c.split(",").map(str => str.trim());
        console.log(c_seperate)
        console.log(c_seperate[0])
        console.log(c_seperate[1])
    })

</script>
<body style="text-align: center; margin-top: 300px">
<a href="/main">메인으로</a>
<input type="hidden" class="dvCartDetlPrice" id="dvCartDetlPrice_16466933" value="33600">
<input type="hidden" class="dvCartDetlId" id="dvCartDetlId_16466933" value="16466933">
<strong class="title">[워크맨] 직장인 단백질 도시락 A 세트(6개입)</strong>
<div class="boxInner">
    <figure class="boxInner__thumb">
        <img src="./그리팅몰 __ 우리집 밥상주치의, 그리팅_files/B_F99317A175504277AB35E79D13A825A6.jpg">
    </figure>
    <div class="detail">
        <div class="detail__lft">
            <p class="boxInner__txt">옵션 : [워크맨] 직장인 단백질 도시락 A
                세트(6개입)</p>
            <p class="boxInner__txt">수량 : 1개 </p>
        </div>
        <div class="detail__rgt price">
            <span class="price__list" id="total_price_list">상품금액
                <span class="num">48,000원</span>
            </span>
            <strong class="price__list">결제예정금액 <span class="num">33,600원</span>
            </strong>
</body>
</html>
