<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css?h=cb606d99bb2418df19b6bc818b41e412">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="/assets/css/styles.min.css?h=94c76ca45cf1136042bce4cad72a7b5e">
</head>
<body id="page-top">
<script>
    if ('${msg}' != '') {
        alert('${msg}');
    }

    // 카테고리 통합 삭제 로직 [5]
    {
        function deleteThis(cgName, element, num) {
            console.log("deleteThis function 진입")
            // let p = $(this).parent().attr('id');
            let grandParent = element.parentElement.parentElement.id
            let parent = element.parentElement.id
            let printInDiv;
            console.log('할배',grandParent)
            let cg= "";
            if (grandParent === 'bDiv') {
                printInDiv = $('#bDiv')
                cg = 'b';
            } else if (grandParent === 'mDiv') {
                printInDiv = $('#mdiv')
                cg = 'm';
            } else if (grandParent-- - 'sDiv') {
                printInDiv = $('#sDiv')
                cg = 's';
            } else {
                console.log("[삭제로직] 영역 재설정 요망")
            }
            console.log(num)
            console.log(cgName)

            $.ajax({
                method: 'get',
                url: "/delete/category?name=" + cgName + "&cg=" + num
            }).done((resp) => {
                console.log("삭제 done 진입")
                makeBtn(cg, resp, grandParent, printInDiv)
            }).fail((err) => {
                console.log("감히 날 삭제하겠다고?")
            })
        }
        function makeBtn(cg, resp, grandParent, printInDiv) {
            console.log("버튼 만들기")
            console.log(resp)
            let i = 1; // div의 인덱스
            let j = 0; // 버튼의 인덱스
            let k = 5
            let cgname = "";
            if (cg==='b') {
                k=8
                cgname='bigCg';
            } else if (cg==='m') {
                cgname='midCg'
            } else if (cg==='s') {
                cgname='smCg'
            }
            let str = "";
            for (const elem of resp) {
                if (j % k === 0) {
                    if (j !== 0) {
                        str += "</div>"; // 이전 div를 닫음
                    }
                    str += "<div id=" + grandParent + i + ">"; // 새로운 div를 생성
                    i++;
                }
                str += "<a class='cgTag' href='javascript:void(0)' onclick='" + cgname + "(" + elem.c_num + ")'>" + elem.c_name + "</a>";
                str += "<button class='btn-close' onclick='deleteThis(\"" + elem.c_name + "\",  this , " + elem.c_num + ")'></button><br><br>";
                j++;
            }
            printInDiv.html(str);
        }
    }

    // 카테고리 통합 추가 로직 [4]
    {
            function enterKeyPress(event, elem) {
                if (event.keyCode === 13) {
                    switch (elem.parentElement.parentElement.id) {
                        case "rightDiv":
                            categoryAdd('mid')
                            $('#midCgAdd').val('')
                            break;
                        case "leftDiv":
                            categoryAdd('big')
                            $('#bigCgAdd').val('')
                            break;
                        case "smallDiv":
                            categoryAdd('sm')
                            $('#smallCgAdd').val('')
                            break;
                        default:
                            console.log("KEY PRESS 에러발생")
                    }
                }
            }

            function categoryAdd(item) {
                console.log("[추가] 함수 진입")
                let cg1 = document.querySelector('#selectedCg').value;
                let bigCgName = document.querySelector('#bigCgAdd').value;
                let bigCgNum = document.querySelector('#selectedBigCgNum').value;
                let midCgName = document.querySelector('#midCgAdd').value;
                let midCgNum = document.querySelector('#selectedMidCgNum').value
                let smallCgName = document.querySelector('#smallCgAdd').value;
                let cgName = "";
                let cgNum = "";
                let cg = "";
                let printInDiv;
                let p = "";
                console.log(item)
                switch (item) {
                    case "big":
                        cgName = bigCgName;
                        cgNum = cg1;
                        cg = 'b'
                        printInDiv = $('#bDiv')
                        p = 'bDiv'
                        break;
                    case "mid":
                        cgName = midCgName;
                        cgNum = bigCgNum;
                        cg = 'm'
                        printInDiv = $('#mDiv')
                        p = 'mDiv'
                        break;
                    case "sm":
                        cgName = smallCgName;
                        cgNum = midCgNum;
                        cg = 's'
                        printInDiv = $('#sDiv')
                        p = 'sDiv'
                        break;
                    default:
                        console.log("[추가] 에러 발생")
                }
                $.ajax({
                    method: 'post',
                    url: "/insert/category",
                    data: {"cgName": cgName, "cgNum": cgNum}
                }).done((resp) => {
                    console.log("[추가] 함수 완료")
                    console.log(resp)
                    makeBtn(cg, resp, p, printInDiv)
                }).fail((err) => {
                    console.log("[추가] 함수 실패")
                })
            }
    }

</script>
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
        <div class="container-fluid d-flex flex-column p-0"><br><br><br>
            <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="/main">
                <div class="sidebar-brand-text mx-3">
                    <span><h1>E R P</h1></span>
                </div>
            </a><br><br>
            <hr class="sidebar-divider my-0"/>
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <%--                사이드바 메뉴 구성--%>
                <li class="nav-item"><a class="nav-link" href="/main"><i class="fas fa-tachometer-alt"></i>
                    <span> 매출 관리</span></a></li>
                <li class="nav-item"><a class="nav-link" href="/delivery"><i class="fas fa-user"></i>
                    <span> 배송 관리</span></a></li>
                <li class="nav-item"><a class="nav-link active" href="/homepageR"><i class="fas fa-table"></i>
                    <span> 홈페이지 관리</span></a></li>
                <li class="nav-item"><a class="nav-link" href="/inventory"><i class="far fa-user-circle"></i>
                    <span> 재고 관리</span></a></li>
                <li class="nav-item"><a class="nav-link" href="/service"><i class="fas fa-user-circle"></i>
                    <span> 고객 센터</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="/">
                        <span> 홈페이지로 </span></a></li>
            </ul>
            <div class="text-center d-none d-md-inline">
                <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
            </div>
        </div>
    </nav>
    <%--    사이드바 End--%>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid">
                    <button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i
                            class="fas fa-bars"></i></button>
                    <form class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text"
                                                        placeholder="Search for ...">
                            <button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button>
                        </div>
                    </form>
                    <ul class="navbar-nav flex-nowrap ms-auto">
                        <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link"
                                                                            aria-expanded="false"
                                                                            data-bs-toggle="dropdown" href="#"><i
                                class="fas fa-search"></i></a>
                            <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in"
                                 aria-labelledby="searchDropdown">
                                <form class="me-auto navbar-search w-100">
                                    <div class="input-group"><input class="bg-light form-control border-0 small"
                                                                    type="text" placeholder="Search for ...">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary py-0" type="button"><i
                                                    class="fas fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <%--                        우측 상단 헤더 알림--%>
                        <li id="noticelist" class="nav-item dropdown no-arrow mx-1">
                            <div class="nav-item dropdown no-arrow">
                                <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown"
                                   href="#">
                                    <span id="span-notice-count" class="badge bg-danger badge-counter"></span>
                                    <i class="fas fa-bell fa-fw"></i></a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                    <h6 class="dropdown-header">알림</h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="me-3">
                                            <div class="bg-primary icon-circle">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="small text-gray-500">24/07/02</span>
                                            <p>보고서 출력 준비가 완료되었습니다</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="me-3">
                                            <div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div><span class="small text-gray-500">24/07/01</span>
                                            <p>580,000￦의 환불비용이 법인계좌로 집행되었습니다</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">
                                        모든 알림 보기</a>

                                </div>
                            </div>
                        </li>
                        <%--                        우측 상단 메세지 리스트--%>
                        <li id="messagelist" class="nav-item dropdown no-arrow mx-1">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link"
                                                                       aria-expanded="false" data-bs-toggle="dropdown"
                                                                       href="#"><span id="span-message-count"
                                                                                      class="badge bg-danger badge-counter">7</span><i
                                    class="fas fa-envelope fa-fw"></i></a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in"><h6
                                        class="dropdown-header">alerts center</h6><a
                                        class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                               src="/assets/img/avatars/avatar4.jpeg?h=fefb30b61c8459a66bd338b7d790c3d5">
                                        <div class="bg-success status-indicator"></div>
                                    </div>
                                    <div class="fw-bold">
                                        <div class="text-truncate"><span>Hi there! I am wondering if you can help me with a problem I've been having.</span>
                                        </div>
                                        <p class="small text-gray-500 mb-0">Emily Fowler - 58m</p></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                               src="/assets/img/avatars/avatar2.jpeg?h=5d142be9441885f0935b84cf739d4112">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div class="fw-bold">
                                        <div class="text-truncate">
                                            <span>I have the photos that you ordered last month!</span></div>
                                        <p class="small text-gray-500 mb-0">Jae Chun - 1d</p></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                               src="/assets/img/avatars/avatar3.jpeg?h=c5166867f10a4e454b5b2ae8d63268b3">
                                        <div class="bg-warning status-indicator"></div>
                                    </div>
                                    <div class="fw-bold">
                                        <div class="text-truncate"><span>Last month's report looks great, I am very happy with the progress so far, keep up the good work!</span>
                                        </div>
                                        <p class="small text-gray-500 mb-0">Morgan Alvarez - 2d</p></div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                               src="/assets/img/avatars/avatar5.jpeg?h=35dc45edbcda6b3fc752dab2b0f082ea">
                                        <div class="bg-success status-indicator"></div>
                                    </div>
                                    <div class="fw-bold">
                                        <div class="text-truncate"><span>Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</span>
                                        </div>
                                        <p class="small text-gray-500 mb-0">Chicken the Dog · 2w</p></div>
                                </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All
                                    Alerts</a></div>
                            </div>
                            <div class="shadow dropdown-list dropdown-menu dropdown-menu-end"
                                 aria-labelledby="alertsDropdown"></div>
                        </li>
                        <div class="d-none d-sm-block topbar-divider"></div>
                        <li class="nav-item dropdown no-arrow">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link"
                                                                       aria-expanded="false" data-bs-toggle="dropdown"
                                                                       href="#"><span
                                    class="d-none d-lg-inline me-2 text-gray-600 small">Admin</span><img
                                    class="border rounded-circle img-profile"
                                    src="/assets/img/avatars/avatar2.jpeg?h=5d142be9441885f0935b84cf739d4112"></a>
                                <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in"><a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a><a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-cogs fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Settings</a><a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Activity log</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#"><i
                                            class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">카테고리 관리</h3>

                <div class="card shadow">
                    <div class="card-header py-3"><p class="text-primary m-0 fw-bold">카테고리 확인 / 추가 / 삭제</p>
                        <div class="categorymenu">
                            <button class="cgSelector" onclick="cg(this)">레시피</button>
                            <button class="cgSelector" onclick="cg(this)">식자재</button>
                            <button class="cgSelector active" onclick="cg(this)">카테고리</button>
                        </div>
                    </div>
                    <div class="col-md-6 text-nowrap" style="margin-left: 10px">
                        <br>
                        <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                            대분류 선택&nbsp;&nbsp;
                            <%--                            <a href="/category?cg=recipe">레시피</a>--%>
                            <%--                            <a href="/category?cg=fooditem">식자재</a>--%>
                            <label>
                                <select name="categorySelect" onchange="BigCg(this.value)">
                                    <option value="none" selected>--선택--</option>
                                    <option value="fooditem">식자재</option>
                                    <option value="recipe">레시피</option>
                                </select>
                                &nbsp;
                            </label>
                        </div>
                        <br>
                    </div>
                    <div style="">
                        <%--대분류카테고리--%>
                        <div id="leftDiv" style="float: left; width: 45%; height: 800px;">
                            <h4 style="text-align: center">대분류</h4>
                            <div style="text-align: center">
                                <input onkeypress="enterKeyPress(event, this)" type="text" id="bigCgAdd" placeholder="추가할 대분류 이름" maxlength="10">
                                <button onclick="categoryAdd('big')">+</button><br><br>
                            </div>
                            <div id="bDiv" style="display: flex;flex-direction: row">

                            </div>

                        </div>
                        <%--중분류카테고리--%>
                        <div id="rightDiv"
                             style="float: right; width: 50%; height: 300px; margin-right: 3%;">
                            <h4 style="text-align: center">중분류</h4>
                                <div id="mDiv" style="display: flex;flex-direction: row">
                                </div>
                                <div style="text-align: center">
                                    <input onkeypress="enterKeyPress(event, this)" type="text" id="midCgAdd" placeholder="추가할 중분류 이름" maxlength="10">
                                    <button onclick="categoryAdd('mid')">+</button>
                                </div>
                        </div>
                        <%--소분류카테고리--%>
                        <div id="smallDiv"
                             style="float: right; width: 50%; height: 450px; margin-top: 3%; margin-right: 3%;">
                            <h4 style="text-align: center">소분류</h4>
                            <div id="sDiv" style="display: flex;flex-direction: row">

                            </div>

                            <div style="text-align: center">
                                <input onkeypress="enterKeyPress(event, this)" type="text" id="smallCgAdd" placeholder="추가할 소분류 이름" maxlength="10">
                                <button onclick="categoryAdd('sm')">+</button>
                            </div>
                        </div>
                        <%--숨겨진 보물상자--%>
                        <div style="display: none">
                                <input type="hidden" id="selectedBigCgNum">
                                <input type="hidden" id="selectedMidCgNum">
                                <input type="hidden" id="selectedCg">
                                <input type="hidden" id="selectedDivId">
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © Brand 2024</span></div>
            </div>
        </footer>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/script.min.js?h=bdf36300aae20ed8ebca7e88738d5267"></script>
<script>
    function cg(cgName) {
        console.log(cgName.innerHTML)
        document.querySelectorAll('.cgSelector').forEach(function(el) {
            el.classList.remove('active');
        });
        cgName.classList.add('active');
        let urlSort;
        if (cgName.innerHTML==='레시피') {
            window.location.href="homepageR"
        } else if (cgName.innerHTML==='식자재') {
            window.location.href="homepageR"
        } else if (cgName.innerHTML==='카테고리') {
            window.location.href="#"
        }
        $.ajax({
            method:'get',
            url:urlSort
        }).done((resp)=>{
        }).fail((err)=>{
        })
    }

</script>
</body>
</html>
