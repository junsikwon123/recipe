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

        List<CtgDto> cgFilterList = categoryList.stream()
                .filter(cg->
                        cg.getC_num().contains(value) ||
                        cg.getC_name().contains(value))
                .toList();
        List<FooditemDto> fiFilterList = fooditemList.stream()
                .filter(fi ->
                        fi.getF_title().contains(value))
                .toList();
        List<TradeDto> tFilterList = tradeList.stream()
                .filter(t ->
                        t.getM_id().contains(value))
                .toList();
        List<TradeItemDto> tiFilterList = tradeItemList.stream()
                .filter(ti->
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
