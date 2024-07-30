<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 30.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * {
            font-family: 'Noto Sans KR';
            font-weight: 500;
        }
        .customerCenter-menu Active {
            color: black;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="../common/header.jsp"></jsp:include>
</header>
<main>
    <h1 style="font-size: large; margin-top: 10px; margin-left: 400px">HOME > 고객센터 > 공지사항</h1>
    <h1 style="font-size: xx-large; margin-top: 30px; margin-left: 400px; font-weight: bold">공지사항</h1>
    <div style="display: flex; flex-direction: row">
        <div style="width: 180px; height: 230px; background-color: #F5F5F5; margin-left: 400px; margin-top: 20px; justify-content: center; border-radius: 20px">
            <br>
            <a class="customerCenter-menu Active" href="/customer/center" style="font-size: large; margin-left: 20px"> 공지사항</a><br><br>
            <a class="customerCenter-menu" href="/customer/problem" style="font-size: large; margin-left: 20px"> 자주 묻는 질문</a><br><br>
            <a class="customerCenter-menu" href="/customer/battle" style="font-size: large; margin-left: 20px"> 1:1신청</a><br><br>
            <a class="customerCenter-menu" href="/customer/dogsound" style="font-size: large; margin-left: 20px"> 진상의 소리</a><br><br>
            <p style="margin-top: 20px; color: #77b347; font-size: xx-large">상담사</p>
            <p style="color: #77b347; font-size: xx-large">황 인 욱</p>
            <p style="color: #77b347; font-size: x-large">010-2857-8839</p>
            <p>평일, 주말, 공휴일 및 시간에 관계없이 편하실 때 전화주세요</p>
        </div>
        <div style="width: 750px; margin-left: 100px; margin-top: 25px">
            <hr>
            <table class="table">
                <thead>
                <tr>
                    <th colspan="2" scope="col">전체 뭐 몇개 있겠지 함 맞춰보던가</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"><input type="text" style="height: 40px; border-radius: 30px" placeholder="  검색어를 입력하세요"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 첫번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 2번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 3번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 4번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 5번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 6번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 7번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                <tr>
                    <td><button style="background-color: white; border: 1px solid black; width: 60px; height: 40px">공지</button></td>
                    <td><a href="#">대충 8번째 공지</a></td>
                    <td></td>
                    <td colspan="2" style="text-align: right">2024-07-30</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div style="margin-left: 900px; margin-top: 50px">
        <ul class="pagination">
            <li class="page-item disabled"><a class="page-link" aria-label="Previous"
                                              href="#"><span aria-hidden="true">«</span></a>
            </li>
            <li class="page-item active"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">1</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">2</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">3</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">4</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">5</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">6</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">7</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">8</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">9</a></li>
            <li class="page-item"><a class="page-link" onclick="pageNumChange(this)" href="javascript:void(0)">10</a></li>
            <li class="page-item"><a class="page-link" aria-label="Next" href="#">
                <span aria-hidden="true">»</span></a></li>&nbsp;&nbsp;&nbsp;&nbsp;
            <sec:authorize access="hasRole('ADMIN')">
                <button>글쓰기</button>
            </sec:authorize>
        </ul>

    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
</main>
</body>
</html>
