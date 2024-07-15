package com.icia.recipe.home.service;

import com.icia.recipe.home.dao.TradeDao;
import com.icia.recipe.dto.TradeDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class TradeService {
    @Autowired
    TradeDao tDao;

    public List<TradeDto> tradeList() {
        List<TradeDto> tList = new ArrayList<>();
        tList=tDao.tradeList();
        return tList;
    }

    public boolean tradeSave(TradeDto tDto) {
        log.info("서비스 입장");
        return tDao.save(tDto);
    }

    public TradeDto tradeDetail(Integer t_num) {
        return tDao.tradeDetail(t_num);
    }
}
