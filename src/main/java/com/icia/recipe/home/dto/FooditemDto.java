package com.icia.recipe.home.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
@Accessors(chain=true)
public class FooditemDto {
    // 상품 테이블
    private int f_num;
    private String m_id;
    private String f_title;
    private String f_contents;
    private String f_price;
    private String f_count;
    private String f_date;
    private String f_edate;
    private int f_views;
    // 카테고리 테이블
    List<CtgDto> cList = new ArrayList<>();
    // 이미지 테이블
    List<ImgDto> iList = new ArrayList<>();
    // 판매량 순
    private String count;
}
