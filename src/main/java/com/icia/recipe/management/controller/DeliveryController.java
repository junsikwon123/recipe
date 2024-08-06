package com.icia.recipe.management.controller;

import com.icia.recipe.management.dao.DeliveryDao;
import com.icia.recipe.management.service.DeliveryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
public class DeliveryController {

    @Autowired
    DeliveryDao dDao;

    @Autowired
    DeliveryService dSer;

    @GetMapping("/delivery")
    public String delivery(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        String m_id=userDetails.getUsername();
        model.addAttribute("m_id",m_id);
        // 일간 배송 관련
        int dayDelivery = dDao.getTodayOrderDelivery();
        int dayOrder = dDao.getTodayOrderCount();
        model.addAttribute("todayDelivery", dayDelivery);
        model.addAttribute("todayOrder", dayOrder);
        int dayOrderCount = dDao.getOrderCount();
        double percentage = 0;
        if (dayOrder > 0) {
            percentage = ((double) dayDelivery / dayOrderCount) * 100;
        }
        DecimalFormat df = new DecimalFormat("0.0");
        log.info("퍼센트 비율 : {}", percentage);
        model.addAttribute("todayPercentage",df.format(percentage));
        // 주간 배송 관련
        int weekDelivery = dDao.getWeekOrderDelivery();
        int weekOrder = dDao.getWeekOrderCount();
        model.addAttribute("weekDelivery", weekDelivery);
        model.addAttribute("weekOrder", weekOrder);
        // 월간 배송 관련
        HashMap MonthlyDelivery = dSer.getMonthlyDelivery();
        model.addAttribute("monthlyDelivery", MonthlyDelivery);
        return "management/delivery";
    }
}
