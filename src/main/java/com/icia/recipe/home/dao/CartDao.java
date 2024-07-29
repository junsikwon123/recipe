package com.icia.recipe.home.dao;

import com.icia.recipe.home.dto.CartDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartDao {

    int insertCartList(@Param("num") String num, @Param("count") String count, @Param("user") String user);

    List<CartDto> selectCart(String name);

    int deleteCart(Object e);
}
