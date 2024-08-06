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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<input id="m_id" name="m_id" value="${m_id}" style="display: none">
<input id="t_num" name="t_num" value="${t_num}" style="display: none">
<input id="t_title" name="t_title" value="${t_title}" readonly><br>
<c:forEach var="trades" items="${tDList}">
    <input id="t_item" value="${trades.t_item}" readonly>
    <input id="t_itemcount" value="${trades.t_itemcount}" type="number" max="${trades.t_itemcount}" min="1">
    <input id="t_unit" value="${trades.t_unit}" readonly>
    <input id="t_change" value="${trades.t_change}">
    <hr>
</c:forEach>
<button id="exchange">교환신청</button>
</body>
<script>
    let itemCnt = document.querySelectorAll("#t_itemcount")
    const isNotNumber = (value) => !/^\d+$/.test(value);
    for (let elem of itemCnt) {
        elem.addEventListener("input", function () {
            const maxVal = elem.getAttribute('max');
            if(isNotNumber(elem.value)){
                elem.value = maxVal ? maxVal : '';
                alert("숫자만 입력해주세요")
            }else if(elem.value>maxVal){
                elem.value=maxVal ? maxVal : '';
                alert("남은 수량을 확인하세요")
            }
        })
    }

    <%--let itemCnt = document.getElementById("t_itemcount")--%>
    <%--const isNotNumber = (value) => /\D/.test(value);--%>
    <%--itemCnt.addEventListener("input", function () {--%>
    <%--    if (itemCnt.value > ${t_itemcount}) {--%>
    <%--        alert("남은 수량을 확인해주세요")--%>
    <%--        itemCnt.value=${t_itemcount}--%>
    <%--    }else if(isNotNumber(itemCnt.value)){--%>
    <%--        alert("숫자만 입력해주세요")--%>
    <%--        itemCnt.value=${t_itemcount}--%>
    <%--    }--%>
    <%--})--%>
    document.getElementById("exchange").addEventListener('click', function () {
        let tradesend = `${sessionScope.login}`
        let m_id = `${m_id}`;
        let t_num =${t_num};
        let title = `${t_title}`;
        let items = document.querySelectorAll("#t_item")
        let itemcounts = document.querySelectorAll("#t_itemcount")
        let units = document.querySelectorAll("#t_unit")
        let changes = document.querySelectorAll("#t_change")
        let length=items.length
        $.ajax({
            url: "/trade/messageSend",
            type: "post",
            success: function (resp) {
                alert("교환신청이 완료되었습니다.")
                for(let i=0;i<length;i++) {
                    let item = items[i].value;
                    let itemcount = itemcounts[i].value;
                    let unit = units[i].value;
                    let change = changes[i].value;
                    if (socket) {
                        let socketMsg = {"tradesend":tradesend,"m_id":m_id,"t_num":t_num,"t_title:":title,"t_item":item,"t_itemcount":itemcount,
                            "t_unit":unit,"t_change":change,"type":"SEND"};
                        socket.send(JSON.stringify(socketMsg))
                    }
                }
            },
            error: function () {
                alert("교환 신청이 실패하였습니다")
            }
        })
    })
</script>
</html>
