package com.icia.recipe.management.controller;

import com.icia.recipe.management.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Slf4j
@Controller
public class HomeController {

    @Autowired
    BoardService bSer;

    @GetMapping("/")
    public String Main(HttpSession session, Model model, Principal principal) {
        return "main";
    }

    @GetMapping("/main")
    public String Sales(HttpSession session, Model model) {
        return "main";
    }

    @GetMapping("/delivery")
    public String delivery(HttpSession session, Model model) {
        return "delivery";
    }

    @GetMapping("/inventory")
    public String inven(HttpSession session, Model model) {
        return "inventory";
    }

    @GetMapping("/service")
    public String serviceCenter(HttpSession session, Model model) {
        return "service";
    }

    @GetMapping("/homepageR")
    public String homepageR(HttpSession session, Model model) {
        return "homepageR";
    }
    @GetMapping("/homepageC")
    public String homepageC(HttpSession session, Model model) {
        return "homepageC";
    }
    @GetMapping("/homepageT")
    public String homepageT(HttpSession session, Model model) {
        return "homepageF";
    }
    @GetMapping("/test")
    public String test(HttpSession session, Model model) {
        return "test";
    }


}
