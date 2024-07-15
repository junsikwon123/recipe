<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
</head>
<script>
    $(function(){
        $('#slick-track').slick({
            slide: 'slick-slide',        //슬라이드 되어야 할 태그 ex) div, li
            infinite : true,     //무한 반복 옵션
            slidesToShow : 1,        // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
            speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : true,         // 옆으로 이동하는 화살표 표시 여부
            dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부

        });
    })

</script>
<style>
    .slider--sec {
        line-height: 1.15;
        -webkit-text-size-adjust: 100%;
        font-family: "Noto Sans Korean";
        -webkit-print-color-adjust: exact;
        color: #1c1c1c;
        position: relative;
        float: left;
    }
</style>
<body>
<div class="slider__sec" id="itemImageSlide">

    <div class="slider slick-initialized slick-slider">
        <button class="slick-prev slick-arrow" aria-label="Previous" type="button" style="">Previous</button>
        <div class="slick-list draggable">
            <div class="slick-track" style="opacity: 1; width: 2750px;">
                <div class="slick-slide" data-slick-index="0" aria-hidden="true"
                     style="width: 550px; position: relative; left: 0px; top: 0px; z-index: 998; opacity: 0; transition: opacity 500ms linear 0s;"
                     tabindex="-1">
                    <div>
                        <div class="slider__list" style="width: 100%; display: inline-block;">
                            <figure>
                                <img src="https://image.greating.co.kr/IL/item/202404/01/CBE9E8BB376B4794BA73165643E6ABF7.jpg"
                                     alt="주꾸미비빔밥(2인분) 987g">
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="slick-slide" data-slick-index="1" aria-hidden="true"
                     style="width: 550px; position: relative; left: -550px; top: 0px; z-index: 998; opacity: 0; transition: opacity 500ms linear 0s;">
                    <div>
                        <div class="slider__list" style="width: 100%; display: inline-block;">
                            <figure>
                                <img src="https://image.greating.co.kr/IL/item/202404/01/39166DC2EEED43AAAED1C878794ADF56.jpg"
                                     alt="">
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="slick-slide slick-current slick-active" data-slick-index="2" aria-hidden="false"
                     style="width: 550px; position: relative; left: -1100px; top: 0px; z-index: 1000; opacity: 1; transition: opacity 500ms linear 0s;"
                     tabindex="-1">
                    <div>
                        <div class="slider__list" style="width: 100%; display: inline-block;">
                            <figure>
                                <img src="https://image.greating.co.kr/IL/item/202404/01/1B303CAC2F18435D9D5B5EF13F1B6434.jpg"
                                     alt="">
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="slick-slide" data-slick-index="3" aria-hidden="true"
                     style="width: 550px; position: relative; left: -1650px; top: 0px; z-index: 998; opacity: 0; transition: opacity 500ms linear 0s;"
                     tabindex="-1">
                    <div>
                        <div class="slider__list" style="width: 100%; display: inline-block;">
                            <figure>
                                <img src="https://image.greating.co.kr/IL/item/202404/01/569A90B91E7C4B7186142F3D3C7643C5.jpg"
                                     alt="">
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="slick-slide" data-slick-index="4" aria-hidden="true"
                     style="width: 550px; position: relative; left: -2200px; top: 0px; z-index: 998; opacity: 0; transition: opacity 500ms linear 0s;"
                     tabindex="-1">
                    <div>
                        <div class="slider__list" style="width: 100%; display: inline-block;">
                            <figure>
                                <img src="https://image.greating.co.kr/IL/item/202404/01/CCB5AE62B7E1455F92DFA6C84E6CD29F.jpg"
                                     alt="">
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="slick-next slick-arrow" aria-label="Next" type="button" style="">Next</button>
        <div class="slick-counter"><span class="current">3</span> / <span class="total">5</span></div>
    </div>
    <!--
    <div class="slick-controller">
        <button class="slick-stop"><span class="hidden">슬라이드 정지</span></button>
        <button class="slick-play hide"><span class="hidden">슬라이드 실행</span></button>
    </div>
     -->
</div>
<a href="/">메인으로</a>

</body>
</html>
