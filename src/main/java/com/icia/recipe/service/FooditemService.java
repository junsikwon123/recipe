package com.icia.recipe.service;

import com.icia.recipe.dao.FooditemDao;
import com.icia.recipe.dto.FooditemDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class FooditemService {

    @Autowired
    FooditemDao fDao;

    public String fooditemOrder(String order){
        log.info("fooditemOrder 입장");
        FooditemDto fDto;
        String name ="";
        String sort ="";
        switch (order){
          case "salePriceAsc":
              name = "f_price";
              break;
          case "salePriceDesc":
              name = "f_price";
              sort = "desc";
              break;
          case "saleCountDesc":
              name = "f_count";
              sort = "desc";
              break;
          case "latestAsc":
              name = "f_num";
              sort = "desc";
              break;
          default:
              return null;
      }
        log.info("order: {},{}",name,sort );
        List<FooditemDto> list = new ArrayList<>();
        list = fDao.searchFooditem(name,sort);
        log.info("fDto : {}", list);
        return makeFooditemListHtml(list);
    }

    private String makeFooditemListHtml(List<FooditemDto> list) {
        StringBuilder sb = new StringBuilder();
        list.forEach(fDto-> {
            sb.append("<li class=\"baby-product renew-badge\">");
            sb.append("<a class=\"baby-product-link\" href=\"/fooditem/fooditemDetail?f_num=" + fDto.getF_num() + "\" style=\"height: 466px\">");
            sb.append("<dl class=\"baby-product-wrap adjust-spacing\" style=\"height: 444px\">");
            sb.append("<dt class=\"image\">");
            sb.append("<img src=\"" + fDto.getI_path() + fDto.getI_name() + "\" width=\"100%\"></dt>");
            sb.append("<dd class=\"descriptions\">");
            sb.append("<div class=\"badges\"></div>");
            sb.append("<div class=\"name\">" + fDto.getF_name() + "</div>");
            sb.append("<div class=\"price-area\"><div class=\"price-wrap\"><div class=\"price\">");
            sb.append("<strong class=\"price-value\" style=\"font-size: 15px\">" + fDto.getF_price() + "</strong>원");
            sb.append("</div></div></div>");
            sb.append("<div class=\"other-info\"><div class=\"rating-star\">");
            sb.append("<span class=\"rating-total-count\">(" + fDto.getF_count() + ")</span>");
            sb.append("</div></div></dd></dl></a></li>");
        });
        log.info("list: {}",sb.toString());
        return sb.toString();
    }
}
