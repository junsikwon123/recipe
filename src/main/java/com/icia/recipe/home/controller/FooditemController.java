package com.icia.recipe.home.controller;

import com.icia.recipe.home.dao.FooditemDao;
import com.icia.recipe.home.dto.FooditemDto;
import com.icia.recipe.home.service.FooditemService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class FooditemController {
    @Autowired
    FooditemService fSer;
    @Autowired
    FooditemDao fDao;
    @GetMapping("/fooditem/main")
    public String foodItemMain(Model model){
        String a ="salePriceAsc";
        String num = "no";
        String list = fSer.fooditemOrder(a,num);
        String cList = fSer.fooditemctg();
        model.addAttribute("list",list);
        model.addAttribute("cList",cList);
        return "main/fooditem/fooditemMain";
    }
    @GetMapping("/fooditem/detail")
    public String foodItemDetail(@RequestParam("f_num") String num, Model model){
        log.info("searchFoodDetail 입장 {}",num);

        /*if (result<0) {
            model.addAttribute("msg","잘못된 요청입니다. 관리자에게 문의해 주세요");
            return "index";
        }*/
        List<FooditemDto> list = fSer.searchFoodDetail(num , model);
        log.info("list: {}",list);
        list.forEach(l ->{
            model.addAttribute("title",l.getF_title());
            model.addAttribute("price",l.getF_price());
            model.addAttribute("volume",l.getF_volume());
            model.addAttribute("cal",l.getF_cal());
            model.addAttribute("save",l.getF_save());
            model.addAttribute("date",l.getF_date());
            model.addAttribute("c_name", l.getCList().get(0).getC_name());
        });
            String info=fSer.fooditemDetailinfo(num,"foodInfo");
            model.addAttribute("info",info);
        return "main/fooditem/fooditemDetail";

    }
}
