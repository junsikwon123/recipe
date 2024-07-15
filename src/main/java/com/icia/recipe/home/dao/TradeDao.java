package com.icia.recipe.dao;

import com.icia.recipe.dto.TradeDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TradeDao {
    @Select("select t_num,t_title from tradetest")
    List<TradeDto> tradeList();

    @Insert("insert into tradetest values(null,#{t_title},#{t_item},#{t_itemcount},#{t_unit},#{t_change})")
    boolean save(TradeDto tDto);

    @Select("select * from tradetest where t_num=#{t_num}")
    TradeDto tradeDetail(Integer t_num);
}
