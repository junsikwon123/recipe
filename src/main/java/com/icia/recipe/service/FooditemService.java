package com.icia.recipe.service;

import com.icia.recipe.dao.FooditemDao;
import com.icia.recipe.dto.FooditemDto;
import com.icia.recipe.dto.CtgDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Slf4j
public class FooditemService {

    @Autowired
    FooditemDao fDao;

    public String fooditemOrder(String order) {
        log.info("fooditemOrder 입장");
        FooditemDto fDto;
        String name = "";
        String sort = "";
        switch (order) {
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
        log.info("order: {},{}", name, sort);
        List<FooditemDto> list = new ArrayList<>();
        list = fDao.searchFooditem(name, sort);
        log.info("fDto : {}", list);
        return makeFooditemListHtml(list);
    }

    private String makeFooditemListHtml(List<FooditemDto> list) {
        StringBuilder sb = new StringBuilder();
        list.forEach(fDto -> {
            sb.append("<li class=\"baby-product renew-badge\">")
            .append("<a class=\"baby-product-link\" href=\"/fooditem/fooditemDetail?f_num=" + fDto.getF_num() + "\" style=\"height: 466px\">")
            .append("<dl class=\"baby-product-wrap adjust-spacing\" style=\"height: 444px\">")
            .append("<dt class=\"image\">")
            .append("<img src=\"" + fDto.getIList().get(0).getI_path() + fDto.getIList().get(0).getI_name() + "\" width=\"100%\"></dt>")
            .append("<dd class=\"descriptions\">")
            .append("<div class=\"badges\"></div>")
            .append("<div class=\"name\">" + fDto.getF_title() + "</div>")
            .append("<div class=\"price-area\"><div class=\"price-wrap\"><div class=\"price\">")
            .append("<strong class=\"price-value\" style=\"font-size: 15px\">" + fDto.getF_price() + "</strong>원")
            .append("</div></div></div>")
            .append("<div class=\"other-info\"><div class=\"rating-star\">")
            .append("<span class=\"rating-total-count\">(" + fDto.getF_count() + ")</span>")
            .append("</div></div></dd></dl></a></li>");
        });
        return sb.toString();
    }

   /* public String searchctg(String c_num) {
        String num = c_num.substring(0);
        log.info("num:{}", num);
        List<FooditemDto> list = new ArrayList<>();
        switch (num) {
            case "1":
                list =fDao.searchCtgBig(c_num);
                break;
            case "2":
                list =fDao.searchCtgMiddle(c_num);
                break;
            case "3":
                list =fDao.searchCtgSmall(c_num);
                break;
            default:
            return null;
        }

        return null;
    }*/

    public String fooditemctg() {
        HashMap<String, String> hMap = new HashMap<>();
        List<CtgDto> cList = new ArrayList<>();
        cList = fDao.searchCtg();
        return ctgMakeHtml(cList);
    }

    private String ctgMakeHtml(List<CtgDto> cList) {
        StringBuilder sb = new StringBuilder();
        cList.forEach(c1 -> {
            if (!c1.getC_num().isEmpty()) {
                sb.append("<li class=\"search-option-item\">")
                        .append("<input type=\"radio\" id=\"").append(c1.getC_num()).append("\">")
                        .append("<label for=\"").append(c1.getC_num()).append("\">")
                        .append("<a class=\"seo-link-url\" href=\"/fooditem/searchctg?=").append(c1.getC_num()).append("\">")
                        .append(c1.getC_name()).append("</a></label>")
                        .append("<a href=\"#\" class=\"btn-fold\">열림</a>");

                if (!c1.getList().isEmpty()) {
                    sb.append("<ul class=\"search-option-items-child\">");
                    c1.getList().forEach(c2 -> {
                        if (!c2.getC_num().isEmpty()) {
                            sb.append("<li class=\"search-option-item\">")
                                    .append("<input type=\"radio\" id=\"").append(c2.getC_num()).append("\">")
                                    .append("<label for=\"").append(c2.getC_num()).append("\">")
                                    .append("<a class=\"seo-link-url\" href=\"/fooditem/searchctg?=").append(c2.getC_num()).append("\">")
                                    .append(c2.getC_name()).append("</a></label>")
                                    .append("<a href=\"#\" class=\"btn-fold\">열림</a>");

                            if (!c2.getList().isEmpty()) {
                                sb.append("<ul class=\"search-option-items-child\">");
                                c2.getList().forEach(c3 -> {
                                    if (!c3.getC_num().isEmpty()) {
                                        sb.append("<li class=\"search-option-item\">")
                                                .append("<input type=\"radio\" id=\"").append(c3.getC_num()).append("\">")
                                                .append("<label for=\"").append(c3.getC_num()).append("\">")
                                                .append("<a class=\"seo-link-url\" href=\"/fooditem/searchctg?=").append(c3.getC_num()).append("\">")
                                                .append(c3.getC_name()).append("</a></label>")
                                                .append("<a href=\"#\" class=\"btn-fold\">열림</a>")
                                                .append("</li>");
                                    }
                                });
                                sb.append("</ul>");
                            }
                            sb.append("</li>");
                        }
                    });
                    sb.append("</ul>");
                }
                sb.append("</li>");
            }
        });

        return sb.toString();

    }

}

