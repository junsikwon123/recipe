package com.icia.recipe.management.controller;

import com.icia.recipe.management.dao.DeliveryDao;
import com.icia.recipe.management.dto.DeliveryDto;
import com.icia.recipe.management.service.DeliveryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
public class DeliveryRestController {

    @Autowired
    DeliveryDao dDao;

    @Autowired
    DeliveryService dSer;

    @PostMapping("/order/delivery/start")
    public List<DeliveryDto> deliveryStart(@RequestParam("keySet") ArrayList keySet, Model model) {
        boolean result = dSer.deliveryStart(keySet);
        if (result) {
            return dDao.getOrderList();
        } else {
            log.info("[배송시작] 컨트롤러 에러");
            return null;
        }
    }

    @PostMapping("/order/delivery/end")
    public List<DeliveryDto> deliveryEnd(@RequestParam("keySet") ArrayList keySet, Model model) {
        boolean result = dSer.deliveryEnd(keySet);
        if (result) {
            return dDao.getOrderList();
        } else {
            return null;
        }
    }
}
