package com.icia.recipe.home.restController;

import com.icia.recipe.home.dto.Member;
import com.icia.recipe.home.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping
public class RestMemberController {
    @Autowired
    MemberService mSer;

    @GetMapping("/search/idpw")
    public List<Member> search(@RequestParam("param") ArrayList param) {
        log.info("[찾기] 컨트롤러 진입");
        switch (param.get(0).toString()) {
            case "아이디":
                String mname = param.get(1).toString();
                String phone = param.get(2).toString();
                if (phone.indexOf('-') == -1) {
                    if (phone.length() == 10) { // 예: 0101234567
                        String phone1 = phone.substring(0, 3);
                        String phone2 = phone.substring(3, 6);
                        String phone3 = phone.substring(6, 10);
                        phone = phone1 + '-' + phone2 + '-' + phone3;
                    } else if (phone.length() == 11) { // 예: 01012345678
                        String phone1 = phone.substring(0, 3);
                        String phone2 = phone.substring(3, 7);
                        String phone3 = phone.substring(7, 11);
                        phone = phone1 + '-' + phone2 + '-' + phone3;
                    } else {
                        // 전화번호가 예상치 못한 길이인 경우에 대한 처리
                        throw new IllegalArgumentException("잘못된 전화번호 형식: " + phone);
                    }
                }
                return mSer.getSearchIdPw(mname, phone);
            case "비밀번호":
                return null;
            default:
                log.info("[찾기] name값 오류");
        }
        log.info("[찾기] 아이디/비밀번호 컨트롤러 에러");
        return null;



    }
}
