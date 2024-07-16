package com.icia.recipe.management.controller;

import com.icia.recipe.management.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MgHomeController {

    @Autowired
    BoardService bSer;

    @GetMapping("/main")
    public String Sales(HttpSession session, Model model) {
        return "management/main";
    }

    @GetMapping("/delivery")
    public String delivery(HttpSession session, Model model) {
        return "management/delivery";
    }

    @GetMapping("/inventory")
    public String inven(HttpSession session, Model model) {
        return "management/inventory";
    }

    @GetMapping("/service")
    public String serviceCenter(HttpSession session, Model model) {
        return "management/service";
    }

    @GetMapping("/homepageR")
    public String homepageR(HttpSession session, Model model) {
        return "management/homepageR";
    }
    @GetMapping("/homepageC")
    public String homepageC(HttpSession session, Model model) {
        return "management/homepageC";
    }
    @GetMapping("/homepageT")
    public String homepageT(HttpSession session, Model model) {
        return "management/homepageF";
    }
    @GetMapping("/test")
    public String test(HttpSession session, Model model) {
        return "management/test";
    }


}
