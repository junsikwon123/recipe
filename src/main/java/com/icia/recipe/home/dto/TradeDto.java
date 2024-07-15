package com.icia.recipe.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
public class TradeDto {

    private int t_num;
    private String i_path;
    private String i_sys_name;
    private String i_original_name;
    private String m_id;
    private String t_count;
    private String t_date;
    private String t_views;
    private String t_title;
    private String m_name;
    private String c_num;
    private String c_name;
    private String t_unit;
    private String t_item;
    private String t_itemcount;
    private String t_change;
}
