package com.icia.recipe.home.dao;

import com.icia.recipe.home.dto.TradeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TradeDao {

    List<TradeDto> tradeList();

    boolean save(TradeDto tDto);

    List<TradeDto> tradeDetail(Integer t_num);

    boolean tradeUpdate(TradeDto tDto);

    boolean tradeDelete(Integer t_num);

    List<TradeDto> tradeDateSort();

    void viewsCount(Integer tNum);

    List<TradeDto> tradeViewSort();

    boolean insertRecommend(TradeDto tDto);

    boolean tradeRecommend(TradeDto tDto);

    String selectRecommend(TradeDto tDto);

    List<TradeDto> tradeCountSort();

    TradeDto tradeExchangefrm(Integer tNum);

    boolean tradeSaveItem(TradeDto tDto);

    List<TradeDto> tradeUpdateList(Integer tNum);

    List<TradeDto> tradeUpList(Integer tNum);

    boolean tradeUpdateItem(TradeDto tDto);

    boolean tradeUpInsert(TradeDto tDto);

    boolean tradeUpDelete(TradeDto tDto);
}
