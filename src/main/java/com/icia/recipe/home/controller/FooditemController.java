package com.icia.recipe.home.controller;

import com.icia.recipe.home.service.FooditemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FooditemController {
    @Autowired
    FooditemService fSer;

    @GetMapping("/fooditem/main")
    public String foodItemMain(Model model){
        String a ="salePriceAsc";
        String list = fSer.fooditemOrder(a);
        String cList = fSer.fooditemctg();
        model.addAttribute("list",list);
        model.addAttribute("cList",cList);
        return "main/fooditem/fooditemMain";
    }
    @GetMapping("fooditem/detail")
    public String foodItemDetail(Model model){
        return "main/fooditem/fooditemDetail";

    }
}
