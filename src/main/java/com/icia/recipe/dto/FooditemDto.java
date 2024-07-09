package com.icia.recipe.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.apache.ibatis.annotations.Mapper;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
@Accessors(chain=true)
public class FooditemDto {
    // 상품 테이블
    private int f_num;
    private String m_id;
    private String f_name;
    private String f_contents;
    private String f_price;
    private String f_inven;
    private String f_date;
    private String f_edate;
    private int f_count;
    // 카테고리 테이블
    private String c_num;
    private String c_num2;
    private String c_name;
    // 이미지 테이블
    private int i_num;
    private String i_path;
    private String i_name;
    // 판매량 순
    private String count;
}
