package com.icia.recipe.management.service;

import com.icia.recipe.management.dao.MoneyDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.HashMap;

@Slf4j
@Service
public class MoneyService {

    @Autowired
    MoneyDao mDao;

    public String getTodayProfitCount() {
        int dayProfit = mDao.getTodayProfitCount();
        log.info(String.valueOf(dayProfit));

        return makeMoneyFormat(dayProfit);
    }

    public String getWeekProfitCount() {
        int weekProfit = mDao.getWeekProfitCount();
        return makeMoneyFormat(weekProfit);
    }

    public String makeMoneyFormat(int money) {
        if (String.valueOf(money).length() > 6) {
            DecimalFormat df = new DecimalFormat("000,000,000");
            return df.format(money);
        } else {
            DecimalFormat df = new DecimalFormat("000,000");
            return df.format(money);
        }
    }

    public HashMap getMonthProfitCount() {
        HashMap monthMap = new HashMap<>();
        for (int i = 1; i <= 12; i++) {
            int monthlyProfit = mDao.getMonthlyProfit(i);
            monthMap.put((i+"월"), monthlyProfit);
            log.info(String.valueOf(monthlyProfit)+"월별 개이득 표");
        }
        return monthMap;
    }
}
