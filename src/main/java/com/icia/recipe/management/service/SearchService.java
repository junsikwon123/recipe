package com.icia.recipe.management.service;

import com.icia.recipe.management.dao.BoardDao;
import com.icia.recipe.management.dao.InvenDao;
import com.icia.recipe.management.dao.SearchDao;
import com.icia.recipe.management.dto.BoardDto;
import com.icia.recipe.management.dto.FoodItemDto;
import com.icia.recipe.management.dto.InvenDto;
import com.icia.recipe.management.dto.MemberDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class SearchService {
    @Autowired
    private BoardDao bDao;

    @Autowired
    private InvenDao iDao;

    @Autowired
    private SearchDao sDao;

    public List<?> getSearchModalDetails(String className, ArrayList param) {
        List<?> thisList = null;
        switch (className) {
            case "inven":
                String cname = param.get(0).toString();
                String code = param.get(1).toString();
                String name = param.get(2).toString();
                thisList = sDao.getSearchModalDetails(cname, code, name);
                break;
            case "invenAdd":
                String company = param.get(0).toString();
                String iname = param.get(1).toString();
                thisList = sDao.getSearchModalDetails(company, iname);
                break;
            default:
        }
        log.info(thisList.toString());
        return thisList;
    }
    public List<?> getSearchListAll(String Keyword) {
        // 재고
        List<FoodItemDto> inven = sDao.getInvenList();
        List<FoodItemDto> searchInven = inven.stream()
                .filter(fis ->
                        fis.getC_name().contains(Keyword) ||
                                fis.getF_date().contains(Keyword) ||
                                fis.getF_date2().contains(Keyword) ||
                                 fis.getF_edate().contains(Keyword) ||
                                fis.getF_edate2().contains(Keyword) ||
                                fis.getF_price().contains(Keyword) ||
                                fis.getF_code().contains(Keyword) ||
                                fis.getF_count().contains(Keyword) ||
                                fis.getF_title().contains(Keyword))
                .toList();
        // 발주내역
        List<InvenDto> invenAdd = sDao.getInvenAddList();
        List<InvenDto> searchInvenAdd = invenAdd.stream()
                .filter(ia ->
                        ia.getIv_vat().contains(Keyword) ||
                                ia.getIv_total().contains(Keyword) ||
                                ia.getIv_price().contains(Keyword) ||
                                ia.getIv_name().contains(Keyword) ||
                                ia.getIv_current().contains(Keyword) ||
                                ia.getIv_count().contains(Keyword) ||
                                ia.getIv_company().contains(Keyword) ||
                                ia.getIv_priceSum().contains(Keyword))
                .toList();
        // 레시피
        List<BoardDto> recipe = sDao.getRecipeList();
        //
        // 회원정보
        List<MemberDto> member;
        // 식자재
//        List<FoodItemDto> fooditem = sDao;
        List<FoodItemDto> searchFoodItem;
        //
        List<List<?>> combinedList = new ArrayList<>();
        combinedList.add(searchInven);
        combinedList.add(searchInvenAdd);
        return combinedList;
    }
}
