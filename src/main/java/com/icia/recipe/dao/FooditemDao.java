package com.icia.recipe.dao;

import com.icia.recipe.dto.FooditemDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface FooditemDao {
    List<FooditemDto> searchFooditem(@Param("name") String name, @Param("sort") String sort);
}
