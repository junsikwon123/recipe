package com.icia.recipe.home.dao;

import com.icia.recipe.home.dto.CartDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface CartDao {

    int insertCartList(@Param("num") String num, @Param("count") String count, @Param("user") String user);

    List<CartDto> selectCart(String name);

    int deleteCart(Object e);

    boolean insertOrder(HashMap<String, String> inputMap);

    boolean insertOrderDetail(HashMap<String, String> e);

    boolean deleteCartName(String id);
}
