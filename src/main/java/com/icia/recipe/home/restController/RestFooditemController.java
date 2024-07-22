package com.icia.recipe.home.restController;

import com.icia.recipe.home.service.FooditemService;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.http.HttpRequest;

@RestController
@Slf4j
public class RestFooditemController {
    @Autowired
    FooditemService fSer;

    @GetMapping("/fooditem/order")
    public String order(@RequestParam("order") String order,@RequestParam("c_num") String num, HttpSession session) {
        log.info("오더 입장: {},{}", order,num);
        if (num.isEmpty()){
            num = "no";
        }
        String list = fSer.fooditemOrder(order,num);
        return list;
    }

    @GetMapping("/fooditem/searchctg")
    public String searchctg(@RequestParam("c_num") String c_num, HttpSession session){
        log.info("카테고리 서치 입장");
        String order ="salePriceAsc";
        String list = fSer.fooditemOrder(order,c_num);
        log.info("list",list);
        return list;
    }

    @GetMapping("/fooditem/restDetail")
    public String fooditemDetail(@RequestParam("f_num") String num, @RequestParam("type") String type) {
        log.info("restFooditemDetail 입장{},{}", num, type);
        String fDinfo = fSer.fooditemDetailinfo(num, type);
        return fDinfo;
    }
}
