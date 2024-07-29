package com.icia.recipe.home.controller;

import com.icia.recipe.home.service.MemberService;
import com.icia.recipe.management.dto.MemberDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@Slf4j
public class HomeController {
    @Autowired
    MemberService mSer;

    @GetMapping("/")
    public String index(MemberDto mDto,HttpSession session, Model model, Principal principal, Authentication auth,@AuthenticationPrincipal UserDetails userDetails) {
        if(userDetails!=null) {
            String m_id = userDetails.getUsername();
            String m_name = mSer.findId(m_id);
            session.setAttribute("m_name", m_name);
            session.setAttribute("login", m_id);
        }
        System.out.println("Principal:"+principal);
        if(session.getAttribute("msg")!=null) {
            model.addAttribute("msg", session.getAttribute("msg"));
            session.removeAttribute("msg");
        }
        return "index";
    }
}
