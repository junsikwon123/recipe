<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24. 7. 2.
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E R P</title>
    <link rel="icon" href="/uploadedImg/main/Management/캡처.PNG" type="image/png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css?h=cb606d99bb2418df19b6bc818b41e412">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="/assets/css/styles.min.css?h=94c76ca45cf1136042bce4cad72a7b5e">
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<script>
    window.onload = function() {
        const ctx = document.getElementById('myChart').getContext('2d');
        const ctx2 = document.getElementById('MonthlyDelivery').getContext('2d');
        let myChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['배송준비중', '배송중', '배송완료'], // X축 라벨
                datasets: [{
                    label: 'On/Off',
                    data: [${todayOrder}, ${todayDelivering}, ${todayDelivery}], // 데이터 값 (배송전 10, 배송완료 5)
                    backgroundColor: [
                        'rgba(75, 192, 192, 0.2)', // 배송전 색상
                        'rgba(100, 145, 220, 0.2)', // 배송전 색상
                        'rgba(153, 102, 255, 0.2)' // 배송완료 색상
                    ],
                    borderColor: [
                        'rgba(75, 192, 192, 1)', // 배송전 테두리 색상
                        'rgba(100, 145, 220, 1)', // 배송전 색상
                        'rgba(153, 102, 255, 1)' // 배송완료 테두리 색상
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + '건';
                            }
                        }
                    }
                }
            }
        });
        let MonthlyDelivery = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                datasets: [{
                    label: 'Show & Proove',
                    data: ["${monthlyDelivery['1월']}", "${monthlyDelivery['2월']}", "${monthlyDelivery['3월']}",
                        "${monthlyDelivery['4월']}", "${monthlyDelivery['5월']}", "${monthlyDelivery['6월']}",
                        "${monthlyDelivery['7월']}", "${monthlyDelivery['8월']}", "${monthlyDelivery['9월']}",
                        "${monthlyDelivery['10월']}", "${monthlyDelivery['11월']}", "${monthlyDelivery['12월']}"],
                    backgroundColor: [
                        'rgba(255, 0, 0, 0.2)',
                        'rgba(255, 127, 0, 0.2)',
                        'rgba(255, 255, 0, 0.2)',
                        'rgba(127, 255, 0, 0.2)',
                        'rgba(0, 255, 0, 0.2)',
                        'rgba(0, 255, 255, 0.2)',
                        'rgba(0, 0, 255, 0.2)',
                        'rgba(75, 0, 130, 0.2)',
                        'rgba(148, 0, 211, 0.2)',
                        'rgba(255, 105, 180, 0.2)',
                        'rgba(255, 69, 0, 0.2)',
                        'rgba(255, 20, 147, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 0, 0, 1)',
                        'rgba(255, 127, 0, 1)',
                        'rgba(255, 255, 0, 1)',
                        'rgba(127, 255, 0, 1)',
                        'rgba(0, 255, 0, 1)',
                        'rgba(0, 255, 255, 1)',
                        'rgba(0, 0, 255, 1)',
                        'rgba(75, 0, 130, 1)',
                        'rgba(148, 0, 211, 1)',
                        'rgba(255, 105, 180, 1)',
                        'rgba(255, 69, 0, 1)',
                        'rgba(255, 20, 147, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function (tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + '건';
                            }
                        }
                    }
                }
            }
        })
    };
</script>

<body id="page-top">
<div id="wrapper">
    <%--    사이드바 E R P--%>
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
                <li class="nav-item"><a class="nav-link active" href="/delivery"><i class="fas fa-user"></i>
                    <span> 배송 관리</span></a></li>
                <li class="nav-item"><a class="nav-link" href="/homepageR"><i class="fas fa-table"></i>
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
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle me-3" type="button"><i
                            class="fas fa-bars"></i></button>
                    <%--                    검색란 --%>
                        <div class="input-group" style="width: 500px">
                            <input class="bg-light form-control border-0 small" type="text"
                                                        placeholder="검색어를 입력하세요" onkeypress="commonSearch(this.value, event)"/>
                            <button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button>
                        </div>
                    <ul class="navbar-nav flex-nowrap ms-auto">
                        <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link"
                                                                            aria-expanded="false"
                                                                            data-bs-toggle="dropdown" href="#"><i
                                class="fas fa-search"></i></a>
                            <%--                            네비게이션 바에 검색버튼이 있다는데 뭔지 모름 ㅋㅋ--%>
                            <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in"
                                 aria-labelledby="searchDropdown">
                                <form class="me-auto navbar-search w-100">
                                    <div class="input-group"><input class="bg-light form-control border-0 small"
                                                                    type="text" placeholder="Search for ..."/>
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
                                <div id="managementAlert"
                                     class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                    <h6 class="dropdown-header">알림</h6>
                                    <%--                                    <a class="dropdown-item text-center small text-gray-500" href="#">--%>
                                    <%--                                        모든 알림 보기</a>--%>
                                </div>
                            </div>
                        </li>
                        <%--                        우측 상단 메세지 리스트--%>
                        <li id="messagelist" class="nav-item dropdown no-arrow mx-1">
                            <div class="nav-item dropdown no-arrow">
                                <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                                    <span id="span-message-count" class="badge bg-danger badge-counter"></span>
                                    <i class="fas fa-envelope fa-fw"></i></a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                    <h6 class="dropdown-header">메세지</h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image me-3">
                                            <img class="rounded-circle" src="/assets/img/avatars/avatar4.jpeg"/>
                                            <div class="bg-success status-indicator"></div>
                                        </div>
                                        <div class="fw-bold">
                                            <div class="text-truncate"><span>Hi there! I am wondering if you can help me with a problem I&#39;ve been having.</span>
                                            </div>
                                            <p class="small text-gray-500 mb-0">Emily Fowler - 58m</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                                   src="/assets/img/avatars/avatar2.jpeg"/>
                                            <div class="status-indicator"></div>
                                        </div>
                                        <div class="fw-bold">
                                            <div class="text-truncate">
                                                <span>I have the photos that you ordered last month!</span></div>
                                            <p class="small text-gray-500 mb-0">Jae Chun - 1d</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                                   src="/assets/img/avatars/avatar3.jpeg"/>
                                            <div class="bg-warning status-indicator"></div>
                                        </div>
                                        <div class="fw-bold">
                                            <div class="text-truncate"><span>Last month&#39;s report looks great, I am very happy with the progress so far, keep up the good work!</span>
                                            </div>
                                            <p class="small text-gray-500 mb-0">Morgan Alvarez - 2d</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                                   src="/assets/img/avatars/avatar5.jpeg"/>
                                            <div class="bg-success status-indicator"></div>
                                        </div>
                                        <div class="fw-bold">
                                            <div class="text-truncate"><span>Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren&#39;t good...</span>
                                            </div>
                                            <p class="small text-gray-500 mb-0">Chicken the Dog · 2w</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">
                                        모든 메세지 보기</a>
                                </div>
                            </div>
                            <div class="shadow dropdown-list dropdown-menu dropdown-menu-end"
                                 aria-labelledby="alertsDropdown"></div>
                        </li>
                        <%--                        우측 상단 프로필--%>
                        <div class="d-none d-sm-block topbar-divider"></div>
                        <li class="nav-item dropdown no-arrow">
                            <input id="nowId" type="text" value="${m_id}" style="display: none">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link"
                                                                       aria-expanded="false" data-bs-toggle="dropdown"
                                                                       href="#">
                                <span class="d-none d-lg-inline me-2 text-gray-600 small">Admin</span>
                                <img class="border rounded-circle img-profile" src="/assets/img/avatars/avatar2.jpeg"/></a>
                                <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i> 내 정보</a>
                                    <a class="dropdown-item" href="#"><i
                                            class="fas fa-cogs fa-sm fa-fw me-2 text-gray-400"></i> 설정</a>
                                    <a class="dropdown-item" href="#"><i
                                            class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i> 사용기록</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i> 로그아웃</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <%--            네비게이션 바 END--%>
            <div class="container-fluid">
                <div class="d-sm-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-dark mb-0">배송 관리</h3><a class="btn btn-primary btn-sm d-none d-sm-inline-block"
                                                            role="button" href="javascript:window.print()"><i
                        class="fas fa-download fa-sm text-white-50"></i> 보고서 출력</a>
                </div>
                <div class="row">
                    <div class="col-md-6 col-xl-3 mb-4 draggable">
                        <div class="card shadow border-start-primary py-2" style="height: 135px; width: 400px">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col me-2">
                                        <div class="text-uppercase text-primary fw-bold text-xs mb-1">
                                            <span style="font-size: larger">일간 배송</span>
                                        </div>
                                        <div class="text-dark fw-bold h5 mb-0" style="display: flex; flex-direction: column">
                                            <div style="width: 214px; justify-content: space-between; display: flex; flex-direction: row">
                                                <div>
                                                    <span style="font-size: small">배송준비중</span>
                                                    <p>${todayOrder}</p>
                                                </div>
                                                <div>
                                                    <span style="font-size: small">배송중</span>
                                                    <p>${todayDelivering}</p>
                                                </div>
                                                <div>
                                                    <span style="font-size: small">배송완료</span>
                                                    <p>${todayDelivery}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto"><i class="fas fa-calendar fa-2x text-gray-300"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4 draggable">
                        <div class="card shadow border-start-success py-2" style="height: 135px; width: 400px">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col me-2">
                                        <div class="text-uppercase text-success fw-bold text-xs mb-1">
                                            <span style="font-size: larger">주간 배송</span>
                                        </div>
                                        <div class="text-dark fw-bold h5 mb-0" style="display: flex; flex-direction: column">
                                            <div style="width: 214px; justify-content: space-between; display: flex; flex-direction: row">
                                                <div>
                                                    <span style="font-size: small">배송준비중</span>
                                                    <p>${weekOrder}</p>
                                                </div>
                                                <div>
                                                    <span style="font-size: small">배송중</span>
                                                    <p>${weekDelivering}</p>
                                                </div>
                                                <div>
                                                    <span style="font-size: small">배송완료</span>
                                                    <p>${weekDelivery}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto"><i class="fas fa-dollar-sign fa-2x text-gray-300"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4 draggable">
                        <div class="card shadow border-start-info py-2" style="height: 135px; width: 400px">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col me-2">
                                        <div class="text-uppercase text-info fw-bold text-xs mb-1">
                                            <span style="font-size: large">금일 전체 주문량<br>대비 배송 완료 현황</span>
                                        </div>
                                        <div class="row g-0 align-items-center">
                                            <div class="col-auto">
                                                <div class="text-dark fw-bold h5 mb-0 me-3">
                                                    <span style="font-size: larger">${todayPercentage}%</span>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm">
                                                    <div class="progress-bar bg-info" aria-valuenow="${todayPercentage}"
                                                         aria-valuemin="0" aria-valuemax="100" style="width: ${todayPercentage}%;"><span
                                                            class="visually-hidden">${todayPercentage}%</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto"><i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4 draggable">
                        <div class="card shadow border-start-warning py-2" style="height: 135px; width: 400px">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col me-2">
                                        <div class="text-uppercase text-warning fw-bold text-xs mb-1">
                                            <span style="font-size: x-large">보류된 업무</span></div>
                                        <div class="text-dark fw-bold h5 mb-0"><span>18</span></div>
                                    </div>
                                    <div class="col-auto"><i class="fas fa-comments fa-2x text-gray-300"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-7 col-xl-8 draggable">
                        <div class="card shadow mb-4" style="height: 420px">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary fw-bold m-0">월간 배송 증감표</h6>
                                <div class="dropdown no-arrow">
                                    <button class="btn btn-link btn-sm dropdown-toggle" aria-expanded="false"
                                            data-bs-toggle="dropdown" type="button"><i
                                            class="fas fa-ellipsis-v text-gray-400"></i></button>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--fade-in">
                                        <p class="text-center dropdown-header">추가 메뉴</p><a
                                            class="dropdown-item" href="#"> Action</a><a class="dropdown-item" href="#"> Another
                                        action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#"> Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="MonthlyDelivery" height="320" style="display: block; width: 572px; height: 320px;"
                                            width="1000"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-xl-4 draggable">
                        <div class="card shadow mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary fw-bold m-0">금일 배송 진행률</h6>
                                <div class="dropdown no-arrow">
                                    <button class="btn btn-link btn-sm dropdown-toggle" aria-expanded="false"
                                            data-bs-toggle="dropdown" type="button"><i
                                            class="fas fa-ellipsis-v text-gray-400"></i></button>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--fade-in">
                                        <p class="text-center dropdown-header">추가 메뉴</p><a
                                            class="dropdown-item" href="#"> Action</a><a class="dropdown-item" href="#"> Another
                                        action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#"> Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart-area" style="justify-items: center">
                                    <canvas id="myChart" style="display: block; width: 200px; height: 300px;">
                                    </canvas>
                                </div>
                                <div class="text-center small mt-4">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 mb-4">
                        <div class="card shadow mb-4 draggable">
                            <div class="card-header py-3">
                                <h6 class="text-primary fw-bold m-0">연령대별 구매분석 [회원가입시 나이 수집 안해서 없어짐..]</h6>
                            </div>
                            <div class="card-body">
                                <h4 class="small fw-bold">10대<span class="float-end">20%</span></h4>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-danger" aria-valuenow="20" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 20%;"><span
                                            class="visually-hidden">20%</span></div>
                                </div>
                                <h4 class="small fw-bold">20대<span class="float-end">40%</span></h4>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-warning" aria-valuenow="40" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 40%;"><span
                                            class="visually-hidden">40%</span></div>
                                </div>
                                <h4 class="small fw-bold">30대<span class="float-end">60%</span></h4>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-primary" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 60%;"><span
                                            class="visually-hidden">60%</span></div>
                                </div>
                                <h4 class="small fw-bold">40대<span class="float-end">80%</span></h4>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-info" aria-valuenow="80" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 80%;"><span
                                            class="visually-hidden">80%</span></div>
                                </div>
                                <h4 class="small fw-bold">50대<span class="float-end">100%</span></h4>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-success" aria-valuenow="100" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 100%;"><span
                                            class="visually-hidden">100%</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-4 draggable">
                            <div class="card-header py-3">
                                <h6 class="text-primary fw-bold m-0">할 일</h6>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <h6 class="mb-0"><strong>점심 먹기</strong></h6><span
                                                class="text-xs">12:20 PM</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="form-check"><input id="formCheck-1" class="form-check-input"
                                                                           type="checkbox"/><label
                                                    class="form-check-label" for="formCheck-1"></label></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <h6 class="mb-0"><strong>낮잠 자기</strong></h6><span
                                                class="text-xs">12:40 PM</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="form-check"><input id="formCheck-2" class="form-check-input"
                                                                           type="checkbox"/><label
                                                    class="form-check-label" for="formCheck-2"></label></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <h6 class="mb-0"><strong>퇴근 하기</strong></h6><span
                                                class="text-xs">20:30 PM</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="form-check"><input id="formCheck-3" class="form-check-input"
                                                                           type="checkbox"/><label
                                                    class="form-check-label" for="formCheck-3"></label></div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-lg-6 mb-4" style="width: 825px">
                                <div class="card text-white bg-primary shadow">
                                    <div class="card-body">
                                        <p class="m-0" style="">팀명 : 기가막히조</p>
                                        <pre class="text-white-50 small m-0"> </pre>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="card text-white bg-success shadow">
                                    <div class="card-body" style="height: 545px">
                                        <p class="m-0" style="font-size: xx-large">완료된 작업</p>
                                        <br>
                                        <br>
                                        <ul>
                                            <li>
                                                하나
                                            </li>
                                            <li>
                                                둘
                                            </li>
                                            <li>
                                                삼
                                            </li>
                                            <li>
                                                넷
                                            </li>
                                            <li>
                                                오
                                            </li>
                                            <li>
                                                여섯
                                            </li>
                                            <li>
                                                칠
                                            </li>
                                            <li>
                                                팔
                                            </li>
                                            <li>
                                                아홉
                                            </li>
                                            <li>
                                                공
                                            </li>
                                        </ul>
                                        <p class="text-white-50 small m-0">
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="card text-white bg-info shadow">
                                    <div class="card-body" style="height: 545px">
                                        <p class="m-0" style="font-size: xx-large">미완료 작업</p>
                                        <br>
                                        <br>
                                        <ul>
                                            <li>
                                                하나
                                            </li>
                                            <li>
                                                둘
                                            </li>
                                            <li>
                                                삼
                                            </li>
                                            <li>
                                                넷
                                            </li>
                                            <li>
                                                오
                                            </li>
                                            <li>
                                                여섯
                                            </li>
                                            <li>
                                                칠
                                            </li>
                                            <li>
                                                팔
                                            </li>
                                            <li>
                                                아홉
                                            </li>
                                            <li>
                                                공
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Made by 이형구</span></div>
            </div>
        </footer>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>

</div>
<script src="/assets/js/script.min.js?h=bdf36300aae20ed8ebca7e88738d5267"></script>
</body>
</html>
