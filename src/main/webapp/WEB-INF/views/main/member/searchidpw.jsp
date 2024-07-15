<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 4.
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script defer src="/common/js/common.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<%--아이디 찾기--%>
<div>
    <form action="/searchid" method="post">
        <input id="id_m_name" name="m_name" type="text" placeholder="이름"><br>
        <br>
        <input id="id_m_phone" name="m_phone" type="text" placeholder="전화번호"><br>
        <br>
        <!-- Button trigger modal -->
        <button id="serIdBtn" type="button" class="btn btn-primary">
            아이디 찾기
        </button>
    </form>
</div>
<br>

<%--비밀번호 찾기--%>
<div>
    <form action="/searchpw" method="post">
        <input id="pw_m_id" name="m_id" type="text" placeholder="아이디"><br>
        <br>
        <input id="pw_m_name" name="m_name" type="text" placeholder="이름"><br>
        <br>
        <input id="pw_m_phone" name="m_phone" type="text" placeholder="전화번호">
        <input id="getCode" type="button" value="인증번호받기"><br>
        <div class="inpCode" style="display: none"><br><input id="authCode" name="authCode" type="text" placeholder="인증번호 6자리">
            <input id="checkCodeBtn" type="button" value="인증번호확인"><br>
            <span id="checkCode"></span>
        </div>
        <br>
        <button id="serPwBtn" type="button" class="btn btn-primary">
            비밀번호 찾기
        </button>
    </form>
</div>
<!--
    • 모달 (Modal)
    - 모달은 대화상자(dialog)가 실행될 때 제어권을 독점하게 되어,
        대화 상자가 종료되기 전까지는 기존 화면을 제어할 수 없는 방식.
    • 모달리스(Modaless)
    - 대화 상자(dialog)가 실행되더라도 기존 화면을 제어할 수 있는 방식을 뜻함.
    -->
<!-- Button trigger modal -->
<!--data전역속성으로 modal설정-->
<!--생성할 모달아이디 -->


<!-- 아이디 찾기 Modal -->
<div class="modal fade" id="searchID" tabindex="-1" aria-labelledby="searchIDLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="searchIDLabel">아이디 찾기 결과</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span id="sucId"></span>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호 찾기 Modal -->
<div class="modal fade" id="searchPW" tabindex="-1" aria-labelledby="searchpwLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/changepw" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="searchPWLabel">비밀번호 변경</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="sucPw">
                        <input id="check_m_id" name="m_id" style="display: none">
                        <input name="m_pw" id="change_m_pw" type="password" placeholder="변경할 비밀번호"><br>
                        <input id="check_change_m_pw" type="password" placeholder="변경할 비밀번호 확인"><br>
                        <span id="check_pw"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="changePwBtn" type="submit" class="btn btn-primary">비밀번호 변경</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    <%--입력값이 없을때 아이디 찾기 모달창 안띄우기--%>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("serIdBtn").addEventListener('click', function () {
            const nameVal = document.getElementById('id_m_name').value.trim(); // 이름 필드의 값 가져오기
            const phoneVal = document.getElementById("id_m_phone").value.trim();
            console.log(nameVal, phoneVal)
            if (nameVal === "" || phoneVal === "") {
                // 이름 필드가 비어있으면 모달 창을 열지 않음
                $('#searchID').modal('hide');
            } else {
                // 이름 필드에 값이 있는 경우, 모달을 수동으로 열기
                $.ajax({
                    type: 'post',
                    url: '/searchid',
                    data: {m_name: nameVal, m_phone: phoneVal}
                }).done((resp) => {
                    console.log("성공햇냐?", resp)
                    if (resp !== 'null') {
                        $("#sucId").text('회원님의 아이디는' + resp + '입니다.')
                    } else {
                        $("#sucId").text('회원님의 아이디를 찾을 수 없습니다')
                    }
                }).fail((err) => {
                    console.log(err)
                })
                $('#searchID').modal('show');
            }
        });
    });
</script>

<script>
    <%--입력값이 없을때 비밀번호 찾기 모달창 안띄우기--%>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("serPwBtn").addEventListener('click', function () {
            const idVal = document.getElementById('pw_m_id').value.trim();
            const nameVal = document.getElementById('pw_m_name').value.trim(); // 이름 필드의 값 가져오기
            const phoneVal = document.getElementById("pw_m_phone").value.trim();
            const inpCode = document.getElementById("authCode").value.trim();
            const checkCode=document.getElementById("checkCode").value
            console.log(idVal, nameVal, phoneVal,inpCode)
            if (idVal === "" || nameVal === "" || phoneVal === ""||inpCode==="") {
                // 이름 필드가 비어있으면 모달 창을 열지 않음
                $('#searchPW').modal('hide');
            }
        });
    });
</script>

<script>
    //비밀번호 변경모달창에서 정보 입력 확인
    const changePw = document.getElementById("change_m_pw")
    const checkChangePw = document.getElementById("check_change_m_pw")
    const checkPw = document.getElementById("check_pw")
    const changePwBtn = document.getElementById("changePwBtn")
    checkChangePw.addEventListener("input", function () {
        if (changePw.value !== checkChangePw.value) {
            checkPw.innerHTML = "비밀번호가 일치하지 않습니다."
        } else {
            checkPw.innerHTML = "비밀번호가 일치합니다."
        }
    })
    changePwBtn.addEventListener("click", function (event) {
        let checkid = document.getElementById("check_m_id")
        checkid.value = document.getElementById('pw_m_id').value
        if (changePw.value === "" || checkChangePw.value === "") {
            event.preventDefault()
            if (changePw.value === "") {
                checkPw.innerHTML = "비밀번호를 입력하세요."
                changePw.focus()
            } else {
                checkPw.innerHTML = "비밀번호확인을 입력하세요."
                checkChangePw.focus()
            }
        }
        if (changePw.value !== checkChangePw.value) {
            event.preventDefault()
            checkChangePw.focus()
        }
    })

    //인증코드 이메일로 발송
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("getCode").addEventListener('click', function () {
            const inpCode = document.querySelector(".inpCode")
            const idVal = document.getElementById('pw_m_id').value.trim();
            const nameVal = document.getElementById('pw_m_name').value.trim(); // 이름 필드의 값 가져오기
            const phoneVal = document.getElementById("pw_m_phone").value.trim();
            if (idVal === "" || nameVal === "" || phoneVal === ""){
                alert("정보를 입력하세요")
            }else{
                $.ajax({
                    type: 'post',
                    url: '/recover',
                    data: {m_id: idVal, m_name: nameVal, m_phone: phoneVal}
                }).done((resp) => {
                    console.log("성공햇냐?", resp)
                    if(resp==="success") {
                        inpCode.style.display = "block"
                    }else{
                        alert("입력하신 회원정보는 없습니다.")
                    }
                }).fail((err) => {
                    console.log(err)
                })
            }
        })
    })

//받은 인증 코드 일치 확인
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("checkCodeBtn").addEventListener('click',function (){
            const authCode=document.getElementById("authCode").value.trim()
            if(authCode===""){
                alert("인증코드를 입력하세요")
            }else{
                $.ajax({
                    type:"post",
                    url:"/checkcode",
                    data:{authCode:authCode}
                }).done((resp)=>{
                    console.log(resp)
                    if(resp===true) {
                        document.getElementById("checkCode").innerHTML ="인증번호가 일치합니다"
                        document.getElementById("checkCodeBtn").disabled="true"
                        document.getElementById("serPwBtn").addEventListener('click', function () {
                            $('#searchPW').modal('show');
                        })
                    }else{
                        document.getElementById("checkCode").innerHTML="인증번호가 일치하지 않습니다"
                        document.getElementById("serPwBtn").addEventListener('click', function () {
                            $('#searchPW').modal('hide');
                        })
                    }
                }).fail((err)=>{
                    console.log(err)
                })
            }
        })
    })
</script>
</body>
</html>
