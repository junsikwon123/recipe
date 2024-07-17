package com.icia.recipe.home.dao;

import com.icia.recipe.home.dto.FooditemDto;
import com.icia.recipe.home.dto.CtgDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FooditemDao {
    List<FooditemDto> searchFooditem(@Param("name") String name, @Param("sort") String sort);

    List<CtgDto> searchCtg();

    List<FooditemDto> searchFoodDetail(@Param("num") String num);

    List<FooditemDto> searchFoodDetailInfo(@Param("num") String num);

    boolean viewsPlus(String num);
}
