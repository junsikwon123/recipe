package com.icia.recipe.restController;

import com.icia.recipe.service.FooditemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class RestFooditemController {
    @Autowired
    FooditemService fSer;
    @GetMapping("/fooditem/order")
    public String order(@RequestParam("order") String order, Model model){
        log.info("오더 입장: {}" ,order);
        String list = fSer.fooditemOrder(order);
        return list;
    }
}
