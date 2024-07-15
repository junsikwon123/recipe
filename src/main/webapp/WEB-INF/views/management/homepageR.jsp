<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    let isSelected = 'false'
    function ckBoxDeleteBtn() {
        let isChecked = document.querySelectorAll("th input[type='checkbox']:checked");
        let deleteKeySet = [];
        isChecked.forEach((item)=>{
            let selectTr = item.closest('tr')
            let deleteKey = selectTr.getAttribute('data-fnum')
            deleteKeySet.push(deleteKey)
        })
        console.log(deleteKeySet)
        $.ajax({
            method:'post',
            url:"/boardlist/delete",
            data:{"deleteKeySet":deleteKeySet}
        }).done((resp) => {
            console.log("[게시글 삭제] 완료")
            let boardList = $('#tableIsHere');
                let reverseResp = resp.reverse();
                boardList.html('')
                let str = "";
                str += "<div class='table-responsive table mt-2' id='dataTable' role='grid' aria-describedby='dataTable_info'>"
                str += "<table class='table my-0' id='dataList'>"
                str += "<tr class='table-primary' style='vertical-align: center'><th>#</th>"
                str += "<th><h4>상품코드<a onclick='boardListSortButton(this.id)' id='fcode' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<th><h4>대분류<a onclick='boardListSortButton(this.id)' id='fcnum' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<th><h4>중분류<a onclick='boardListSortButton(this.id)' id='fcnum2' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<th><h4>상품이름<a onclick='boardListSortButton(this.id)' id='ftitle' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<th><h4>가격<a onclick='boardListSortButton(this.id)' id='fprice' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<th><h4>수량<a onclick='boardListSortButton(this.id)' id='fcount' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<th><h4>등록일<a onclick='boardListSortButton(this.id)' id='fdate' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<th><h4>유통기한<a onclick='boardListSortButton(this.id)' id='fedate' class='Asort'><img src='/assets/img/a/sort.png' style='width: 20px; height: 20px'></a></h4></th>"
                str += "<td><input id='allClickCk' onclick='allClickCk(this)' value='selectAll' type='checkbox'>전체선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' onclick='ckBoxDeleteBtn()' class='btn btn-danger'>삭제</button></td>"
                str += "</tr>"
                let i = 1;
                for (const elem of reverseResp) {
                    str += "<tr data-fnum='" + elem.f_num + "'>"
                    str += "<td>" + i + "</td>"
                    str += "<td>" + elem.f_code + "</td>"
                    str += "<td>" + elem.c_num + "</td>"
                    str += "<td>" + elem.c_num2 + "</td>"
                    str += "<td>" + elem.f_title + "</td>"
                    str += "<td>" + elem.f_price + "</td>"
                    str += "<td>" + elem.f_count + "</td>"
                    str += "<td>" + elem.f_date + "</td>"
                    str += "<td>" + elem.f_edate + "</td>"
                    str += "<th><input class='ckBox' name='selectCk' type='checkbox'></th>"
                    str += "</tr>"
                    i++
                }
            str += "</table><br><br>"
            boardList.html(str)
        }).fail((err) => {
            console.log("[게시글 삭제] 실패")
        })
    }

    function allClickCk(selectAll) {
        const i = document.getElementsByName('selectCk')
        i.forEach((ck)=>{
            ck.checked = selectAll.checked;
        })
    }
</script>
<!-- 첫번째 모달 창 -->
<div class="modal fade" id="outerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="closeOuterModalButton"></button>
            </div>
            <form>
                <div class="modal-body">
                    <h1 id="outerModalTitle" style="text-align: center"></h1>
                    <div style="display: flex;flex-direction: row;justify-content: space-between">
                        <div class="uploadImg">
                            <img id="previewImg" onclick="popImage(this.src)"><br>
                            <div>
                                <div class="file_input">
                                    <img id="preview" style="width: 300px; height: 300px; border: none"><br>
                                    <label>
                                        <input type="file" multiple name="files" onchange="selectFile(this);">
                                    </label>

                                </div>
                            </div>
                        </div>
                        <div style="display: flex;flex-direction: row-reverse">
                            <div id="modalDetails">

                            </div>
                            <div id="modalDetails2">

                            </div>
                            <div id="modalDetails3">

                            </div>
                            <div id="modalDetails4">

                            </div>
                            <input type="button" id="hiddenSubmit" style="display:none;">
                            <input type="text" id="formSort" style="display: none">
                        </div>
                    </div>
                    <div id="modalDiv">


                        <br>
                        <div>
                            <input name="foodItemTitle-modalInput" id="outerContentsTitle" type="text" placeholder="제 목"
                                   style="width: 100%;height: 70px; font-size: xx-large">
                            <input name='foodItemContents-modalInput' id="outerContents" type="text" placeholder="내 용"
                                   style="width: 100%;height: 400px;">
                        </div>
                    </div>
                </div>
            </form>

            <div class="modal-footer">
                <a href="javascript:document.querySelector('#hiddenSubmit').click()" onclick="modalInputForm()"
                   id="modal-input-submit" class="btn btn-primary">등록</a>
            </div>
        </div>
    </div>
</div>

<!-- 두번째 모달 창 -->
<%--<div class="modal fade" id="innerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeInnerModalButton"></button>--%>
<%--            </div>--%>
<%--            <div id="modalData" class="modal-body">--%>


<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                <button type="button" class="btn btn-primary">Understood</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

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
                                    src="/assets/img/avatars/avatar2.jpeg"></a>
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
                <h3 class="text-dark mb-4">게시판 관리</h3>

                <div class="card shadow">
                    <div class="card-header py-3">
                        <p id="boardTitle" class="text-primary m-0 fw-bold">레시피 게시글 리스트</p>
                        <div class="categorymenu">
                            <button class="cgSelector" onclick="cgSort(this)">레시피</button>
                            <button class="cgSelector" onclick="cgSort(this)">식자재</button>
                            <button class="cgSelector" onclick="cgSort(this)">카테고리</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label
                                        class="form-label">Show&nbsp;<select
                                        class="d-inline-block form-select form-select-sm">
                                    <option value="10" selected="">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>&nbsp;</label>
                                    </div>
                            </div>
                            <div class="col-md-6">

                                <div class="text-md-end dataTables_filter" id="dataTable_filter">
                                    <button type="button" id="registerBtn 2" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#outerModal">등록</button>
                                    <label class="form-label">
                                        <input type="search" class="form-control form-control-sm"
                                               aria-controls="dataTable" placeholder="페이지 내 검색">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <%--                            ====================================================================================--%>
                            <%--데이터 리스트--%>
                            <%--                            ====================================================================================--%>
                            <h1 id="data" style="text-align: center">레시피/식자재 을(를) 선택해주세요</h1>
                        </div>
                        <div id="tableIsHere">

                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center"><p id="dataTable_info" class="dataTables_info"
                                                                       role="status" aria-live="polite">Showing 1 to 10
                                of 27</p></div>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                    <button type="button" id="registerBtn" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#outerModal">등록</button>&nbsp;&nbsp;&nbsp;
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a class="page-link" aria-label="Previous"
                                                                          href="#"><span aria-hidden="true">«</span></a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span
                                                aria-hidden="true">»</span></a></li>
                                    </ul>
                                </nav>
                            </div>
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
</body>
</html>
