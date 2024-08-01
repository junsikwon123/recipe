<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 19.
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script defer src="/common/js/common.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<input name="t_num" value="${t_num}" style="display: none">
<input name="t_title" value="${t_title}" readonly><br>
<c:forEach var="trades" items="${tDList}">
    <input id="t_item" value="${trades.t_item}" readonly>
    <input id="t_itemcount" value="${trades.t_itemcount}">
    <input id="t_unit" value="${trades.t_unit}" readonly>
    <input id="t_change" value="${trades.t_change}">
    <hr>
</c:forEach>
<button id="exchange">교환신청</button>
</body>
<script>
    let itemCnt = document.getElementById("t_itemcount")
    const isNotNumber = (value) => /\D/.test(value);
    itemCnt.addEventListener("input", function () {
        if (itemCnt.value > ${t_itemcount}) {
            alert("남은 수량을 확인해주세요")
            itemCnt.value=${t_itemcount}
        }else if(isNotNumber(itemCnt.value)){
            alert("숫자만 입력해주세요")
            itemCnt.value=${t_itemcount}
        }
    })
    document.getElementById("exchange").addEventListener('click', function () {
        let tradesend = `${sessionScope.login}`
        let m_id = `${m_id}`;
        let t_num =${t_num};
        let title = `${t_title}`;
        let item = document.getElementById("t_item").value
        let itemcount = document.getElementById("t_itemcount").value
        let unit = document.getElementById("t_unit").value
        let change = document.getElementById("t_change").value
        const param = {"t_num": t_num,"t_item":item,"t_itemcount":itemcount};

        $.ajax({
            url: "/trade/messageSend",
            type: "post",
            data:param,
            success: function (resp) {
                alert("교환신청이 완료되었습니다.")
                // location.reload()
                if (socket) {
                    let socketMsg = tradesend + "," + m_id + "," + t_num + "," + title + "," + item + "," + itemcount + "," + unit + "," + change;
                    socket.send(socketMsg)
                }
            },
            error: function () {
                alert("교환 신청이 실패하였습니다")
            }
        })
    })
</script>
</html>
