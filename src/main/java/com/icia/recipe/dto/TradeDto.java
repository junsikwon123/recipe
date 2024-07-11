package com.icia.recipe.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
public class TradeDto {
    private int t_num;
    List<CtgDto> cList=new ArrayList<>();
    private String m_id;
    private String t_count;
    private String t_date;
    private String t_views;
}
