package com.icia.recipe.home.service;

import com.icia.recipe.home.dao.CartDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;

@Service
public class CartService {
    @Autowired
    CartDao cDao;
    public String intoCartList(HashMap<String, String> hMap, Model model) {
        int result = cDao.insertCartList(hMap.get("num"),hMap.get("count"),hMap.get("user"));
        if (result <=0){
            model.addAttribute("msg", "성공하지 못하였습니다. 관리자에게 문의해주십시요");
            return "redirect:/";
        }
        return null;
    }
}
