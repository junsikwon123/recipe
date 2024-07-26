package com.icia.recipe.management.service;

import com.icia.recipe.management.dao.BoardDao;
import com.icia.recipe.management.dao.InvenDao;
import com.icia.recipe.management.dto.FoodItemDto;
import com.icia.recipe.management.dto.InvenDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class CommonService {

    @Autowired
    InvenDao iDao;

    @Autowired
    BoardDao bDao;

    public List<?> getSearchModalDetails(String className, ArrayList param) {
        List<?> thisList = null;
        switch (className) {
            case "inven":
                String cname = param.get(0).toString();
                String code = param.get(1).toString();
                String name = param.get(2).toString();
                thisList = bDao.getSearchModalDetails(cname, code, name);
            case "invenAdd":
                String company = param.get(0).toString();
                String iname = param.get(1).toString();
                thisList = iDao.getSearchModalDetails(company, iname);
        }
        log.info(thisList.toString());
        return thisList;
    }
}
