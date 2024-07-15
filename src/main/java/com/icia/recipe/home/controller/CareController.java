package com.icia.recipe.home.controller;

import com.icia.recipe.home.service.CareService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class CareController {
    @Autowired
    CareService cSer;

    @GetMapping("/careMain")
    public String careMain(){
        return "main/care/careMain";
    }

    @GetMapping("/lowSugar")
    public String lowSugar(){
        String lowSugar=cSer.lowSugar();
        log.info(lowSugar);
        return null;
    }
}
