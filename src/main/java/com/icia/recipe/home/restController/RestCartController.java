package com.icia.recipe.home.restController;

import com.icia.recipe.home.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

@RestController
@Slf4j
public class RestCartController {
    @Autowired
    CartService cSer;
    @GetMapping("/cart/deleteList")
    public String deleteList(@RequestParam("ca_num") List num, Model model, Principal pr){
        String name = pr.getName();
        log.info("restDelete 입장.{}",num);
        return cSer.deleteCart(num,model,name);

    }
}
