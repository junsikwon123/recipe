package com.icia.recipe.home.restController;

import com.icia.recipe.home.service.MainSearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
public class MainSearchController {

    @Autowired
    MainSearchService cSer;

    @GetMapping("/common/main/search")
    public String mainSearchList(@RequestParam("value") String value, Model model) {
        List<?> mainSearchList = cSer.getAllTableList(value);
        model.addAttribute("mainSearchList", mainSearchList);
        return "main/common/mainsearch";

    }


}
