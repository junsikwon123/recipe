package com.icia.recipe.controller;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@Slf4j
public class HomeController {
    @GetMapping("/")
    public String index(HttpSession session, Model model, Principal principal, Authentication auth) {
        System.out.println("Principal:"+principal);
        if(session.getAttribute("msg")!=null) {
            model.addAttribute("msg", session.getAttribute("msg"));
            session.removeAttribute("msg");
        }
        return "index";
    }
}
