package com.icia.recipe.service;

import com.icia.recipe.dao.CareDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareService {
    @Autowired
    CareDao cDao;
    public String lowSugar() {
        StringBuilder sb=new StringBuilder();
       return null;
    }
}
