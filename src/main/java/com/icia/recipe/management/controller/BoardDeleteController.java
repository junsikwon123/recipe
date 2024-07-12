package com.icia.recipe.management.controller;

import com.icia.recipe.management.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController //@ResponseBody생략 가능
public class BoardDeleteController {
    @Autowired
    private BoardService bSer;

    @GetMapping("/delete/category")
    public List<?> deleteCategory(@RequestParam("name") String name, @RequestParam("cg") String cg) {
        return bSer.deleteCategory(name, cg);
    }


}