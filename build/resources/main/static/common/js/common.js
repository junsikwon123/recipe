const menu = document.querySelectorAll(".menu a")
menu[0].addEventListener("click", () => {
    menu[1].classList.remove("on")
    menu[0].classList.add("on")
    location.href = "/"
})
function zz() {
    console.log("내가왔다")
    menu[1].addEventListener("click", () => {
        menu[0].classList.remove("on")
        menu[1].classList.add("on")
        var imageUrls = [
            "/assets/img/저당식단.jpg",
            "/assets/img/칼로리식단.jpg",
            "/assets/img/알레르기식단.jpg",
            "/assets/img/단백질식단.jpg",
            "/assets/img/나만의식단.jpg",
        ]
        $.ajax({
            url: imageUrls[0],
            type: "get",
            xhrFields: {
                responseType: 'blob' // 응답을 Blob으로 설정
            },
            success: function (data) {
                var img = document.createElement('img');
                img.src = URL.createObjectURL(data); // Blob을 URL로 변환하여 이미지 src에 설정
                $('#content1').empty(); // 기존 내용 삭제
                $('#content1').append(img); // 새로운 이미지 추가
            },
            error: function (xhr, status, error) {
                console.error('Error loading image: ' + error);
            }
        })
        $.ajax({
            url: imageUrls[1],
            type: "get",
            xhrFields: {
                responseType: 'blob' // 응답을 Blob으로 설정
            },
            success: function (data) {
                var img = document.createElement('img');
                img.src = URL.createObjectURL(data); // Blob을 URL로 변환하여 이미지 src에 설정
                $('#content2').empty(); // 기존 내용 삭제
                $('#content2').append(img); // 새로운 이미지 추가
            },
            error: function (xhr, status, error) {
                console.error('Error loading image: ' + error);
            }
        })
        $.ajax({
            url: imageUrls[2],
            type: "get",
            xhrFields: {
                responseType: 'blob' // 응답을 Blob으로 설정
            },
            success: function (data) {
                var img = document.createElement('img');
                img.src = URL.createObjectURL(data); // Blob을 URL로 변환하여 이미지 src에 설정
                $('#content3').empty(); // 기존 내용 삭제
                $('#content3').append(img); // 새로운 이미지 추가
            },
            error: function (xhr, status, error) {
                console.error('Error loading image: ' + error);
            }
        })
        $.ajax({
            url: imageUrls[3],
            type: "get",
            xhrFields: {
                responseType: 'blob' // 응답을 Blob으로 설정
            },
            success: function (data) {
                var img = document.createElement('img');
                img.src = URL.createObjectURL(data); // Blob을 URL로 변환하여 이미지 src에 설정
                $('#content4').empty(); // 기존 내용 삭제
                $('#content4').append(img); // 새로운 이미지 추가
            },
            error: function (xhr, status, error) {
                console.error('Error loading image: ' + error);
            }
        })
        $.ajax({
            url: imageUrls[4],
            type: "get",
            xhrFields: {
                responseType: 'blob' // 응답을 Blob으로 설정
            },
            success: function (data) {
                var img = document.createElement('img');
                img.src = URL.createObjectURL(data); // Blob을 URL로 변환하여 이미지 src에 설정
                $('#content5').empty(); // 기존 내용 삭제
                $('#content5').append(img); // 새로운 이미지 추가
            },
            error: function (xhr, status, error) {
                console.error('Error loading image: ' + error);
            }
        })
    })
}

const idModal = new bootstrap.Modal('#searchID', {
    keyboard: false,
    backdrop: 'static'
})

const pwModal = new bootstrap.Modal('#searchPW', {
    keyboard: false,
    backdrop: 'static'
})

