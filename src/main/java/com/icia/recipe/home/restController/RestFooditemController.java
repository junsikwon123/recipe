package com.icia.recipe.home.restController;

import com.icia.recipe.home.service.FooditemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class RestFooditemController {
    @Autowired
    FooditemService fSer;

    @GetMapping("/fooditem/order")
    public String order(@RequestParam("order") String order) {
        log.info("오더 입장: {}", order);
        String list = fSer.fooditemOrder(order);
        return list;
    }
    /*
    @GetMapping("/fooditem/searchctg")
    public String searchctg(@RequestParam("searchctg") String c_num){
        log.info("카테고리 서치 입장");
        String list = fSer.searchctg(c_num);
        return list;
    }*/

    @GetMapping("/fooditem/restDetail")
    public String fooditemDetail(@RequestParam("f_num") String num, @RequestParam("type") String type) {
        log.info("restFooditemDetail 입장{},{}", num, type);
        String fDinfo = fSer.fooditemDetailinfo(num, type);
        return fDinfo;
    }
}
