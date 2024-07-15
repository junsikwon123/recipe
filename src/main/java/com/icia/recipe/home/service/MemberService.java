package com.icia.recipe.home.service;

import com.icia.recipe.home.dao.MemberDao;
import com.icia.recipe.home.dto.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class MemberService {
    @Autowired
    MemberDao mDao;

    @Autowired
    PasswordEncoder passwordEncoder;
    public boolean join(Member member) {
        System.out.println("pwEncoder: "+passwordEncoder);
        member.setM_pw(passwordEncoder.encode(member.getM_pw()));
        return mDao.join(member);
    }

    public String searchid(Member member) {
        return mDao.searchid(member);
    }

    public String searchpw(Member member) {
        return mDao.searchpw(member);
    }

    public boolean changepw(Member member) {
        member.setM_pw(passwordEncoder.encode(member.getM_pw()));
        return mDao.changepw(member);
    }
}
