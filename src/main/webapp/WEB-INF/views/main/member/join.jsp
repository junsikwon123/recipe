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
<form name="joinfrm" action="/join" method="post" onsubmit="return check()">
    <input class="id" name="m_id" type="text" placeholder="아이디" title="아이디"><br>
    <span class="checkMSG"></span>
    <input class="pw" name="m_pw" type="password" placeholder="비밀번호" title="비밀번호"><br>
    <span class="checkMSG"></span>
<%--    <input class="pwCheck" name="m_pw" type="password" placeholder="비밀번호확인" title="비밀번호확인"><br>--%>
<%--    <span class="checkMSG"></span>--%>
    <input class="name" name="m_name" type="text" placeholder="이름" title="이름"><br>
    <span class="checkMSG"></span>
    <input class="address" name="m_address" type="text" placeholder="주소" title="주소"><br>
    <span class="checkMSG"></span>
    <input class="phone" name="m_phone" type="text" placeholder="전화번호" title="전화번호"><br>
    <span class="checkMSG"></span>
    <input type="submit" value="회원가입">
</form>
<a href="/cancle">
    <button>취소</button>
</a>
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
