package com.icia.recipe.home.controller;

import com.icia.recipe.home.dto.Member;
import com.icia.recipe.home.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
public class MemberController {

    @Autowired
    MemberService mSer;

    @PreAuthorize("isAnonymous()")
    @GetMapping("/joinfrm")
    public String join() {
        return "main/member/memberjoin";
    }

    @GetMapping("/agreefrm")
    public String agree() {
        return "main/member/caulseAgree";
    }

    @GetMapping("/member/join")
    public String join(Model model) {
        return "main/member/join";
    }

    @PostMapping("/join")
    public String join(@ModelAttribute Member member) {
        boolean result = mSer.join(member);
        if (result) {
            log.info("회원가입 성공");
            return "main/member/login";
        } else {
            log.info("회원가입 실패");
            return "main/member/join";
        }
    }

    @PreAuthorize("isAnonymous()")
    @GetMapping("/loginfrm")
    public String loginfrm() {
        return "main/member/login";
    }

    @GetMapping("searchfrm")
    public String searchfrm() {
        return "main/member/searchidpw";
    }

    @PreAuthorize("isAnonymous()")
    @GetMapping("/member/login")
    public String login() {
        return "main/member/login";
    }

    @GetMapping("/member/login/error")
    public String loginError(Model model) {
        model.addAttribute("msg", "로그인 실패");
        return "main/member/login";
    }

    @PostMapping("/changepw")
    public String changepw(@ModelAttribute Member member, HttpSession session) {
        session.removeAttribute("authCode");
        boolean result = mSer.changepw(member);
        if (result) {
            log.info("비밀번호 변경 성공");
            return "redirect:/login";
        } else {
            log.info("비밀번호 변경 실패");
            return "main/member/searchidpw";
        }
    }
    @GetMapping("/customer/center")
    public String customerCenter() {
        return "main/customerservice/announcement";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/customer/battle")
    public String keyboardBattle() {
        return "main/customerservice/keyboardbattle";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/customer/dogsound")
    public String dogSound() {
        return "main/customerservice/dogsound";
    }

    @GetMapping("/customer/problem")
    public String problem() {
        return "main/customerservice/problem";
    }

    @GetMapping("/cancle")
    public String cancle(){
        return "index";
    }
    @GetMapping("/member/mypage")
    public String mypage() {
        return "main/member/mypage";
    }
    @GetMapping("/delivery/info")
    public String delivery() {
        return "main/member/mypage";
    }
}
