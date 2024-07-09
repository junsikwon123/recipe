const menu = document.querySelectorAll(".menu a")
menu[0].addEventListener("click",()=>{
    menu[1].classList.remove("on")
    menu[0].classList.add("on")

})
menu[1].addEventListener("click",()=>{
    menu[0].classList.remove("on")
    menu[1].classList.add("on")
})