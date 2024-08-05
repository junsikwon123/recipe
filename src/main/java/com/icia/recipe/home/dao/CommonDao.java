package com.icia.recipe.home.dao;

import com.icia.recipe.home.dto.CtgDto;
import com.icia.recipe.home.dto.FooditemDto;
import com.icia.recipe.home.dto.TradeDto;
import com.icia.recipe.home.dto.TradeItemDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommonDao {

    @Select("")
    List<CtgDto> getCategoryList();

    @Select("")
    List<FooditemDto> getFooditemList();

    @Select("")
    List<TradeDto> getTradeList();

    @Select("")
    List<TradeItemDto> getTradeItemList();
}
