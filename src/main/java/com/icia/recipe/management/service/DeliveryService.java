package com.icia.recipe.management.service;

import com.icia.recipe.management.dao.DeliveryDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class DeliveryService {
    @Autowired
    DeliveryDao dDao;

    public HashMap getMonthlyDelivery() {
        HashMap monthMap = new HashMap<>();
        for (int i = 1; i <= 12; i++) {
            int monthlyDelivery = dDao.getMonthlyDelivery(i);
            monthMap.put((i+"월"), monthlyDelivery);
        }
        return monthMap;
    }
}
