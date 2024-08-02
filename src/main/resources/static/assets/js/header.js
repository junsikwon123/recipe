let socket = null;
$(document).ready(function () {
    //소켓 연결
    connectWs();
    $.ajax({
        url:"/alert/List",
        method:"post",
    }).done(resp=>{
        $('#socketAlert').empty()
        $('#socketAlert').append("<h6 class='dropdown-header'>알림</h6>")
        $('#socketAlert').append(resp)
    }).fail(err=>{
        console.log(err)
    })
});

function connectWs() {
    let ws = new SockJS("/push");
    socket = ws;

    ws.onopen = function () {
        console.log('open');
    };
    ws.onmessage = function (event) {
        let $socketAlert = $('#socketAlert');
        //EchoHandler에서 설정한 메세지 넣어줌
        $socketAlert.append(event.data)
        // $socketAlert.css('display', 'block');
        // ws.onclose = function () {
        //     console.log('close');
        // };
    }
}

function accept(t_num,item,itemcount) {
    let tNum=t_num
    let t_item=item;
    let t_itemcount=itemcount;
    const param={"t_num":tNum,"t_item":t_item,"t_itemcount":t_itemcount}
    $.ajax({
        url: "/trade/accept",
        method: "post",
        data: param,
    }).done(resp => {
        console.log(resp)
        if (resp === true) {

        }else{
            console.log("실패")
        }
    }).fail(err => {
        console.log(err)
    })
}

function refuse(t_num,tradesend,m_id) {
    console.log("거절 글번호: " + t_num);
    console.log("거절 당할사람: "+tradesend)
    let removeDiv=document.getElementById("notification-"+t_num+"-"+tradesend)
    removeDiv.remove();

    $.ajax({
        url:"/trade/refuse",
        method: "post",
        data:{"t_num":t_num,"tradesend":tradesend,"m_id":m_id},
    }).done(resp=>{
        console.log(resp)
        $.each(resp,function (index,alert){
            let alerts=`
                    <div class="me-3" id="notification">
                    <i class="fas fa-file-alt text-white"></i>
                    </div>
                    </div>
                    <div id="socketAlertDiv">
                    <span id="current-time" class="small text-gray-500">
                    
                `
        })
    }).fail(err=>{
        console.log(err)
    })
}


function commonSearch(value, event) {
    if (event.keyCode === 13) {
        if (window.find(value)) { // 찾고자 하는 결과가 현재 페이지에 있으면 강조표시하고 함수 종료
            return
        } else {
            // window.location.href='/main/search/result'
            // $.ajax({
            //     method:'get',
            //     url:"/common/main/search?value="+value
            // }).done(resp=>{
            //     console.log(resp)
            // }).fail(err=>{
            //     console.log(err)
            // })
        }


    }
}