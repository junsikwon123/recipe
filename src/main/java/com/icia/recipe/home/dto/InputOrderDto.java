package com.icia.recipe.home.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
@Accessors(chain=true)
public class InputOrderDto {
    private String f_num;
    List<ItemListDto> itemList;
    List<InputListDto> inputList;
}
