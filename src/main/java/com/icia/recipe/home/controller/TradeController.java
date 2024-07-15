package com.icia.recipe.home.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class TradeController {

    @GetMapping("/trade/main")
    public String trade(){

        return "trade/tradeMain";
    }
}
