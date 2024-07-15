package com.icia.recipe.home.restController;

import com.icia.recipe.home.dto.Member;
import com.icia.recipe.home.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping
public class RestMemberController {
    @Autowired
    MemberService mSer;

    @PostMapping("/searchid")
    public String searchid(@ModelAttribute Member mem) {
        StringBuilder sb = new StringBuilder();
        String member = null;
        member = mSer.searchid(mem);
        sb.append(member);
        log.info("========member:{}", member);
        return sb.toString();
    }
}
