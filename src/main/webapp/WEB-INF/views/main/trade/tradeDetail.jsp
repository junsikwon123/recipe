<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 11.
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
<html>
<head>
    <title>Title</title>
    <script defer src="/common/js/common.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<input name="t_num" value="${t_num}" style="display: none">
<input name="t_title" value="${t_title}"><br>
<c:forEach var="trades" items="${tDList}">
    <input value="${trades.t_item}" >
    <input value="${trades.t_itemcount}">
    <input value="${trades.t_unit}">
    <input value="${trades.t_change}">
    <hr>
</c:forEach>
<sec:authorize access="isAuthenticated()">
    <div>
        <button id="exchangefrm">교환신청</button>
    </div>
</sec:authorize>
추천은 로그인 해야된다 짜스가
<sec:authorize access="isAuthenticated()">
<div>
    <button id="recommend">추천</button>
</div>
</sec:authorize>
<c:if test="${m_id==sessionScope.login}">
    <button id="updateBtn" onclick="update_board('${t_num}')">수정</button>
    <button id="deleteBtn" onclick="delete_board('${t_num}')">삭제</button>
</c:if>
<sec:authorize access="hasRole('ADMIN')">
    <button id="deleteBtn" onclick="delete_board('${t_num}')">삭제(관리자)</button>
</sec:authorize>
<%--좋아요 알림이 보이는 부분--%>
<div id="socketAlertDiv">
    <div id="socketAlert" class="alert alert-warning" role="alert"></div>
</div>
<footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
<script>
    function update_board(t_num) {
        location.href = "/trade/updatefrm?t_num=" + t_num
    }

    function delete_board(t_num) {
        let conf = confirm("정말 삭제하겠습니까?")
        if (conf === true) {
            location.href = "/trade/delete?t_num=" + t_num
        }
    }

    $(document).ready(function () {
        document.getElementById("recommend").addEventListener("click", function () {
                $.ajax({
                    url: "/trade/recommend",
                    type: "post",
                    data: {t_num:${t_num}}
                }).done((resp) => {
                    console.log(resp)
                    if (resp) {
                        alert("추천하였습니다.")
                    } else {
                        alert("이미 추천했습니다.")
                    }
                }).fail((err) => {
                    console.log(err)
                })
            })
        })
    let socket = null;
    $(document).ready(function () {
        //소켓 연결
        connectWs();
    });

    function connectWs() {
        let ws = new SockJS("/push");
        socket = ws;

        ws.onopen = function () {
            console.log('open');
        };
        ws.onmessage = function (event) {
            console.log(event.data);
            let $socketAlert = $('#socketAlert');
            //EchoHandler에서 설정한 메세지 넣어줌
            $socketAlert.html(event.data)
            $socketAlert.css('display', 'block');
            ws.onclose = function () {
                console.log('close');
            };
        }
    }
    document.getElementById("exchangefrm").addEventListener("click",function(){
        let tradesend=`${sessionScope.login}`
        let m_id=`${m_id}`;
        let t_num=${t_num};
        let title=`${t_title}`;
        const param = {"tradesend": tradesend, "m_id": m_id, "t_num": t_num, "title": title};

        $.ajax({
            url:"/trade/exchange",
            type:"post",
            data:param,
            success:function (resp){
                alert("교환신청이 완료되었습니다.")
                // location.reload()
                if(socket){
                    let socketMsg=tradesend+","+m_id+","+t_num+","+title;
                    socket.send(socketMsg)
                }
            },
            error:function (){
                alert("교환 신청이 실패하였습니다")
            }
        })
    })
</script>
</body>
</html>
