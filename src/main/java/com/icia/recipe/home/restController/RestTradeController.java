package com.icia.recipe.home.restController;

import com.icia.recipe.home.dto.TradeDto;
import com.icia.recipe.home.service.TradeService;
import com.icia.recipe.management.dao.BoardDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.stream.Location;
import java.util.List;

@RestController
@Slf4j
@EnableMethodSecurity(securedEnabled = true)
public class RestTradeController {
    @Autowired
    TradeService tSer;

    @GetMapping("/trade/dateSort")
    public List<TradeDto> tradeDateSort(){
        List<TradeDto> tDateList=tSer.tradeDateSort();
        log.info(""+tDateList);
        return tDateList;
    }

    @GetMapping("/trade/viewSort")
    public List<TradeDto> tradeViewSort(){
        List<TradeDto> tViewList=tSer.tradeViewSort();
        log.info(""+tViewList);
        return tViewList;
    }

    @GetMapping("/trade/countSort")
    public List<TradeDto> tradeCountSort(){
        List<TradeDto> tCountList=tSer.tradeCountSort();
        log.info(""+tCountList);
        return tCountList;
    }

    @PostMapping("/trade/recommend")
    public boolean tradeRecommend(TradeDto tDto,@RequestParam("t_num") Integer t_num,@AuthenticationPrincipal UserDetails userDetails){
        String m_id=userDetails.getUsername();
        tDto.setM_id(m_id);
        tDto.setT_num(t_num);
        boolean result=tSer.tradeRecommend(tDto);
        log.info("result: {}",result);
        if(result){
            log.info("성공햇슈ㅋㅋ");
            return true;
        }else{
            log.info("실패햇슈ㅠㅠ");
            return false;
        }
    }

    @PostMapping("/trade/exchange")
    public boolean tradeExchange(){
        return true;
    }
}
