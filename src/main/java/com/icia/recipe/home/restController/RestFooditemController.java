package com.icia.recipe.home.restController;

import com.icia.recipe.home.dto.SearchDto;
import com.icia.recipe.home.service.FooditemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@Slf4j
public class RestFooditemController {
    @Autowired
    FooditemService fSer;

    @GetMapping("/fooditem/order")
    public HashMap<String, String> order(@RequestParam("order") String order, @RequestParam("c_num") String num, SearchDto sDto) {
        int pageCount = 20;
        if (sDto.getPageNum() == null)
            sDto.setPageNum(1);
        if (sDto.getListCnt() == null)
            sDto.setListCnt(pageCount);
        if (sDto.getStartIdx() == null)
            sDto.setStartIdx(0);
        sDto.setStartIdx((sDto.getPageNum()-1)*sDto.getListCnt());
        HashMap<String,String> hMap = new HashMap<>();
        hMap.put("type","order");
        sDto.setData(hMap);
        String listUrl = "/fooditem/order?c_num"+ num +"&";
        log.info("오더 입장: {},{},{}", order,num,sDto);
        if (num.isEmpty()){
            num = "no";
        }
        HashMap<String,String> dvMap = new HashMap<>();
        dvMap.put("list",fSer.fooditemOrder(order,num, sDto));
        dvMap.put("pageHtml", fSer.getPaging(num,sDto,listUrl));
        return dvMap;
    }

    @GetMapping("/fooditem/searchctg")
    public HashMap<String, String> searchctg(@RequestParam("c_num") String c_num, SearchDto sDto){
        int pageCount = 20;
        if (sDto.getPageNum() == null)
            sDto.setPageNum(1);
        if (sDto.getListCnt() == null)
            sDto.setListCnt(pageCount);
        if (sDto.getStartIdx() == null)
            sDto.setStartIdx(0);
        sDto.setStartIdx((sDto.getPageNum()-1)*sDto.getListCnt());
        HashMap<String,String> hMap = new HashMap<>();
        hMap.put("type","searchCtg");
        sDto.setData(hMap);
        String listUrl = "/fooditem/searchctg?c_num="+ c_num +"&";
        log.info("카테고리 서치 입장: {},{}",c_num,sDto);
        String order ="salePriceAsc";
        HashMap<String,String> dvMap = new HashMap<>();
        dvMap.put("list",fSer.fooditemOrder(order,c_num, sDto));
        dvMap.put("pageHtml", fSer.getPaging(c_num,sDto,listUrl));
        return dvMap;
    }

    @GetMapping("/fooditem/restDetail")
    public String fooditemDetail(@RequestParam("f_num") String num, @RequestParam("type") String type) {
        log.info("restFooditemDetail 입장{},{}", num, type);
        String fDinfo = fSer.fooditemDetailinfo(num, type);
        return fDinfo;
    }
}
