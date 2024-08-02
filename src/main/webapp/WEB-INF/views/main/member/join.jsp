<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 3.
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<header>
    <jsp:include page="../common/header.jsp"></jsp:include>
</header>
<main>
    <h1 style="font-size: large; margin-top: 10px; margin-left: 400px">HOME > 회원가입</h1><br>
    <section style="margin-top: 50px; margin-left: 550px; width: 40%; text-align: center">
        <form name="joinfrm" action="/join" method="post" onsubmit="return check()">
            <table>
                <tr class="table-group-divider">
                    <th colspan="4" style="font-size: x-large; font-weight: bold; color: black">회원 정보 입력</th>
                </tr>
                <tr>
                    <th style="font-size: larger; color: black">이름</th>
                    <th colspan="4"><input class="name" name="m_name" placeholder="  한글은 10자, 영문은 20자 이내로 입력해 주세요" type="text" title="이름" style="height: 50px; width: 600px">
                        </th>
                </tr>
                <tr>
                    <th></th>
                    <th colspan="4"><span class="checkMSG"></span></th>
                </tr>
                <tr>
                    <th style="font-size: larger; color: black">아이디</th>
                    <th colspan="4"><input class="id" name="m_id" type="text" placeholder="  6자리 이상의 영문 혹은 영문, 숫자를 조합하여 입력해 주세요" title="아이디" style="height: 50px; width: 600px"></th>
                </tr>
                <tr>
                    <th></th>
                    <th colspan="4"><span class="checkMSG"></span></th>
                </tr>
                <tr>
                    <th style="font-size: larger; color: black">비밀번호</th>
                    <th colspan="4"><input class="pw" name="m_pw" type="password" placeholder="  영문, 대소문자, 숫자, 특수문자 중 3개 이상을 조합하여 8자리 이상 입력해 주세요" title="비밀번호" style="height: 50px; width: 600px"></th>
                </tr>
                <tr>
                    <th></th>
                    <th colspan="4"><span class="checkMSG"></span></th>
                </tr>
                <tr>
                    <th style="font-size: larger; color: black">비밀번호 확인</th>
                    <th colspan="4"><input class="pwCheck" name="m_pw" type="password" placeholder="  비밀번호확인" title="비밀번호확인" style="height: 50px; width: 600px"></th>
                </tr>
                <tr>
                    <th></th>
                    <th colspan="4"><span class="checkMSG"></span></th>
                </tr>
                <tr>
                    <th style="font-size: larger; color: black">주소</th>
                    <th colspan="4"><input class="address" name="m_address" type="text" placeholder="  주소" title="주소" style="height: 50px; width: 600px"></th>
                </tr>
                <tr>
                    <th style="font-size: larger; color: black">휴대폰번호</th>
                    <th><input class="phone" name="m_phone" type="text" placeholder="  전화번호" title="전화번호" style="height: 50px; width: 600px"></th>
                </tr>
                <tr>
                    <th style="font-size: larger; color: black">성별</th>
                </tr>
            </table>
            <input type="submit" id="joinSubmitHiddenBtn" value="회원가입" style="display: none">
        </form>
        <a href="javascript:document.querySelector('#joinSubmitHiddenBtn').click()" style="height: 50px; width: 300px; background-color: #77b347; color: white; font-size: larger; font-weight: bold">회원가입</a>
        <button onclick="location.href='/'" style="margin-top: 100px">홈페이지로</button>
    </section>

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
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
</main>
<footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
<script>

    const frm = document.joinfrm;
    const length = frm.length - 1;
    const check1=document.getElementsByClassName("checkMSG")
    const len=check1.length-1
    for(let i = 0; i < length; i++){
        frm.addEventListener("input",function (){
            if(frm[i].value.trim()!==""){
                check1[i].style.display="none"
                check1[i].innerHTML=frm[i].title+"를 입력하세요"
            }else{
                check1[i].style.display="block"
            }
        })
    }

    function check() {
        for (let i = 0; i < length; i++) {
            if (frm[i].value === "" || frm[i].value === null) {
                alert(frm[i].title + "입력!!!")
                frm[i].focus()
                return false;
            }
        }
        alert('서버로')
        return true;
    }
</script>
</body>
</html>
