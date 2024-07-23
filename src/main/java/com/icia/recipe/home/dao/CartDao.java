package com.icia.recipe.home.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CartDao {

    int insertCartList(@Param("num") String num, @Param("count") String count, @Param("user") String user);
}
