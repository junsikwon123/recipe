package com.icia.recipe.controller;

import com.icia.recipe.dto.Member;
import com.icia.recipe.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@Slf4j
public class MemberController {

//    @GetMapping("/")
//    public String index(HttpSession session, Model model, Principal principal, Authentication auth) {
//        System.out.println("Principal:"+principal);
//        if(session.getAttribute("msg")!=null) {
//            model.addAttribute("msg", session.getAttribute("msg"));
//            session.removeAttribute("msg");
//        }
//        return "index";
//    }

    @GetMapping("joinfrm")
    public String join(){
        return "member/memberjoin";
    }

    @GetMapping("/agreefrm")
    public String agree(){
        return "member/caulseAgree";
    }

    @GetMapping("/member/join")
    public String join(Model model){
        return "member/join";
    }
    @GetMapping("/cancle")
    public String cancel(){
        return "index";
    }

    @Autowired
    MemberService mSer;

    @PostMapping("/join")
    public String join(@ModelAttribute Member member){
        boolean result=mSer.join(member);
        if(result){
            log.info("회원가입 성공");
            return "member/login";
        }else{
            log.info("회원가입 실패");
            return "member/join";
        }
    }

    @GetMapping("loginfrm")
    public String loginfrm(){
        return "member/login";
    }

    @GetMapping("searchfrm")
    public String searchfrm(){
        return "member/searchidpw";
    }

    @PreAuthorize("isAnonymous()")
    @GetMapping("/member/login")
    public String login() {
        return "member/login";
    }
    @GetMapping("/member/login/error")
    public String loginError(Model model) {
        model.addAttribute("msg", "로그인 실패");
        return "member/login";
    }

    @PostMapping("/changepw")
    public String changepw(@ModelAttribute Member member, HttpSession session){
        session.removeAttribute("authCode");
        boolean result=mSer.changepw(member);
        if(result){
            log.info("비밀번호 변경 성공");
            return "redirect:/member/login";
        }else{
            log.info("비밀번호 변경 실패");
            return "member/searchidpw";
        }
    }
}
