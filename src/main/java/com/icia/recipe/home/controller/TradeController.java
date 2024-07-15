package com.icia.recipe.home.controller;

import com.icia.recipe.dto.TradeDto;
import com.icia.recipe.service.TradeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
public class TradeController {

    @Autowired
    TradeService tSer;

    @GetMapping("/trade/main")
    public String tradeMain(Model model){
        List<TradeDto> tList=tSer.tradeList();
        model.addAttribute("tList",tList);
        log.info(">>>>>tList:{}",tList);
        return "trade/tradeMain";
    }

    @GetMapping("/trade/detail")
    public String tradeDetail(Model model, @RequestParam("t_num") Integer t_num){
        log.info("...."+t_num);
        TradeDto tDto=tSer.tradeDetail(t_num);
        String t_item = tDto.getT_item();
        String[] item = t_item.split(",");
        String t_itemcount = tDto.getT_itemcount();
        String[] itemcount = t_itemcount.split(",");
        String t_unit = tDto.getT_unit();
        String[] unit = t_unit.split(",");
        String t_change = tDto.getT_change();
        String[] change = t_change.split(",");

        // 모델에 배열을 저장
        model.addAttribute("itemArray", item);
        model.addAttribute("itemcountArray", itemcount);
        model.addAttribute("unitArray", unit);
        model.addAttribute("changeArray", change);
        model.addAttribute("tDto",tDto);
        return "trade/tradeDetail";
    }

    @GetMapping("/trade/write")
    public String tradeWrite(){
        return "trade/tradeWrite";
    }

    @GetMapping("/trade/save")
    public String tradesave(TradeDto tDto){
        log.info("컨트롤러 입장");
        boolean result=tSer.tradeSave(tDto);
        if(result){
            log.info(">>>>>>>>>save성공");
            return "redirect:/trade/main";
        }else{
            log.info(">>>>>>>>>save실패");
            return "trade/tradeWrite";
        }
    }
}
