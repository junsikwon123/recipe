package com.icia.recipe.management.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryDao {

    int getTodayOrderDelivery();

    int getTodayOrderCount();

    int getWeekOrderDelivery();

    int getWeekOrderCount();

    int getOrderCount();

    int getMonthlyDelivery(int i);
}
