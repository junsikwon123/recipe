package com.icia.recipe.home.controller;

import com.icia.recipe.home.service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.HashMap;

@Controller
@Slf4j
public class CartController {

    @Autowired
     CartService cSer;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/cart/main")
    public String cartMain(HttpSession session, Principal principal, Model model) {
        log.info("장바구니 메인 입장");
        String name = principal.getName();
        if (!name.isEmpty()) {
            log.info("user: {}", name);
            String list = cSer.selectCart(name,model);
            model.addAttribute("caList", list);
        }
        return "main/cart/cartMain";
    }

    @GetMapping("/cart/intoCart")
    public String cartIntoCart(@RequestParam("num") String num, @RequestParam("count") String count, @AuthenticationPrincipal UserDetails user, Model model) {
        log.info("intoCart 입장");
        HashMap<String, String> hMap = new HashMap<>();
        hMap.put("num", num);
        hMap.put("count", count);
        hMap.put("user", user.getUsername());
        cSer.intoCartList(hMap, model);

        return null;
    }

    @GetMapping("/cart/test")
    public String cartTest() {
        return "main/fooditem/test";
    }
}
