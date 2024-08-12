package com.icia.recipe.home.service;

import com.icia.recipe.home.dao.CommonDao;
import com.icia.recipe.home.dto.CtgDto;
import com.icia.recipe.home.dto.FooditemDto;
import com.icia.recipe.home.dto.TradeDto;
import com.icia.recipe.home.dto.TradeItemDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class MainSearchService {

    @Autowired
    CommonDao cDao;

    public List<?> getAllTableList(String value) {
        List<CtgDto> categoryList = cDao.getCategoryList();
        List<FooditemDto> fooditemList = cDao.getFooditemList();
        List<TradeDto> tradeList = cDao.getTradeList();
        List<TradeItemDto> tradeItemList = cDao.getTradeItemList();
        String[] values = null;
        if (value.contains(" ")) {
            values = value.split(" ");
        } else if (value.contains(", ")) {
            values = value.split(", ");
        }
        if (values != null) {

        }
        List<CtgDto> cgFilterList = categoryList.stream()
                .filter(cg->
                        cg.getC_num().contains(value) ||
                        cg.getC_name().contains(value))
                .toList();
        List<FooditemDto> fiFilterList = fooditemList.stream()
                .filter(fi ->
                        fi.getF_title().contains(value) ||
                        fi.getF_contents().contains(value) ||
                        fi.getF_price().contains(value) ||
                        fi.getF_count().contains(value) ||
                        fi.getF_date().contains(value) ||
                        fi.getF_edate().contains(value))
                .toList();
        List<TradeDto> tFilterList = tradeList.stream()
                .filter(t ->
                        t.getM_name().contains(value) ||
                        t.getT_title().contains(value))
                .toList();
        List<TradeItemDto> tiFilterList = tradeItemList.stream()
                .filter(ti->
                        ti.getT_item().contains(value) ||
                        ti.getT_change().contains(value))
                .toList();
        List<List<?>> allList = new ArrayList<>();
        allList.add(cgFilterList);
        allList.add(fiFilterList);
        allList.add(tFilterList);
        allList.add(tiFilterList);
        return allList;
    }
}
