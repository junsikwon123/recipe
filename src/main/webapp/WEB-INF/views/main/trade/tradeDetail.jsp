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
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<input name="t_num" value="${t_num}" style="display: none">
<input name="t_title" value="${t_title}"><br>
<c:forEach var="trades" items="${tDList}">
    <input id="t_item" value="${trades.t_item}" >
    <input id="t_itemcount" value="${trades.t_itemcount}">
    <input id="t_unit" value="${trades.t_unit}">
    <input id="t_change" value="${trades.t_change}">
    <hr>
</c:forEach>
<sec:authorize access="isAuthenticated()">
    <div>
        <button onclick="exchangefrm(${t_num})">교환창으로</button>
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

    function exchangefrm(t_num){
        location.href="/trade/exchangefrm?t_num="+t_num
    }


</script>
</body>
</html>
