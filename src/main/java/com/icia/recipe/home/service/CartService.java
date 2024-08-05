package com.icia.recipe.home.service;

import com.icia.recipe.home.dao.CartDao;
import com.icia.recipe.home.dto.CartDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;

@Service
@Slf4j
public class CartService {
    @Autowired
     CartDao cDao;

    public String intoCartList(HashMap<String, String> hMap, Model model) {
        int result = cDao.insertCartList(hMap.get("num"),hMap.get("count"),hMap.get("user"));
        if (result <=0){
            model.addAttribute("msg", "성공하지 못하였습니다. 관리자에게 문의해주십시요");
            return "redirect:/";
        }
        return null;
    }

    public String selectCart(String name,Model model) {
        List<CartDto> cDto =cDao.selectCart(name);
        log.info("장바구니에 있는 수: {}",cDto.size());
        model.addAttribute("count",cDto.size());
        return makeCartList(cDto);
    }

    private String makeCartList(List<CartDto> cDto) {
        StringBuilder sb = new StringBuilder();
            cDto.forEach(cart ->{
                int fPrice =Integer.parseInt(cart.getFList().get(0).getF_price());
                String soldAll = (fPrice * cart.getCa_count())+"";
                soldAll = soldAll.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
                String sold = fPrice+"";
                sold = sold.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
                sb.append("<li class=\"orderCartBox__list single  \"><div class=\"orderCartBox__list__inner\">")
                        .append("<input type=\"hidden\" name=\"dvItemId\" value=\"").append(cart.getFList().get(0).getF_num()).append("\">") // id
                        .append("<input type=\"hidden\" name=\"dvItemName\" value=\"").append(cart.getFList().get(0).getF_title()).append("\">") // title
                        .append("<input type=\"hidden\" name=\"dvItemPrice\" value=\"").append(fPrice * cart.getCa_count()).append("\">") // 총가격
                        .append("<input type=\"hidden\" name=\"dvCartId\" value=\"").append(cart.getCa_num()).append("\">") // 카테고리 넘버(삭제용)
                        .append("<input type=\"hidden\" name=\"dvItemcount\" value=\"").append(cart.getCa_count()).append("\">") // 구매 원하는 수량
                        .append("<input type=\"hidden\" name=\"dvItemMaxcount\" value=\"").append(cart.getFList().get(0).getF_count()).append("\">") // 판매 가능한 수량
                        .append("<div class=\"checkBoxAll\"><span class=\"checks\">")
                        .append("<input type=\"checkbox\" id=\"prdSelect").append(cart.getCa_num()).append("\" name=\"all\" title=\"상품선택\" checked=\"checked\">")
                        .append("<label for=\"prdSelect").append(cart.getCa_num()).append("\"></label>")
                        .append("</span></div>")
                        .append("<div class=\"orderCartBox__list__cont\"><figure class=\"cont__img\">")
                        .append("<a href=\"/fooditem/detail?f_num=").append(cart.getFList().get(0).getF_num()).append("\">")
                        .append("<img src=\"").append(cart.getIList().get(0).getI_path()).append(cart.getIList().get(0).getI_sys_name()).append("\"onerror=\"this.src='/uploadedImg/main/noImg.png';\"")
                        .append("</a></figure><div class=\"cont__text\">")
                        .append("<a href=\"/fooditem/detail?f_num=").append(cart.getFList().get(0).getF_num()).append("\">")
                        .append("<strong class=\"cont__title\">").append(cart.getC_name()).append(" ").append(cart.getFList().get(0).getF_title()).append("</strong>")
                        .append("</a></div></div>")
                        .append("<span class=\"selling-price price01\">").append(sold).append("원</span><div class=\"prd_value\">")
                        .append("<span class=\"prd_length\"><input type=\"text\" min=\"1\" maxlength=\"5\" class=\"dvCartDetlQty\" value=\"").append(cart.getCa_count()).append("\">")
                        .append("<button type=\"button\" class=\"btn_st1_plus\">수량 감소</button><button type=\"button\" class=\"btn_st1_minus\">수량 증가</button>")
                        .append("</span> <span class=\"discount-tooltip bottom qtyDcToolTip_127565 hide\"></span> </div>")
                        .append("<span class=\"selling-price price02\">").append(soldAll).append("원</span><button type=\"button\" class=\"btn__list-delete dvDelCartDetl\">")
                        .append("<span class=\"hidden\">삭제</span></button></div></li>");
            });
        return sb.toString();
    }

    public String deleteCart(List num, Model model, String name) {
        num.forEach(e->{
            int result =  cDao.deleteCart(e);
            if(result<0){
               //추후 모달을 이용하든 해서 조건 추가
            }
        });
        List<CartDto> cDto =cDao.selectCart(name);
        return makeCartList(cDto);
    }
}
