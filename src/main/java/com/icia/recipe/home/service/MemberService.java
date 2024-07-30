package com.icia.recipe.home.service;

import com.icia.recipe.home.dao.MemberDao;
import com.icia.recipe.home.dto.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public String findId(String m_id) {
        return mDao.findId(m_id);
    }

    public List<Member> getSearchIdPw(String mname, String phone) {
        return mDao.getSearchIdPw(mname, phone);
    }

    public String getSearchPw(String id, String name, String phone) {
        return mDao.getSearchPw(id, name, phone);
    }

    public boolean updateTempPw(String id, String name, String phone, String pw) {
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
        pw = passwordEncoder.encode(pw);
        log.info("[비번암호화] 성공 : {}", pw);
        boolean result = mDao.updateTempPw(id, name, phone, pw);
        if (result) {
            log.info("[비번] 첫번째 이프 통과");
            String newPw = mDao.tempPwConfirm(pw);
            if (newPw!=null) {
                log.info("비번 업데이트 진짜 완료");
                return true;
            } else {
                return false;
            }
        } else {
            log.info("[비번] 첫번째 리설트 실패");
            return false;
        }
    }

    public boolean updateNewPw(String pw, String newPw) {
        log.info("[비번변경] pw : {}", pw);
        log.info("[비번변경] newPw : {}", newPw);
        Member member = new Member();
        newPw = passwordEncoder.encode(newPw);
        if (newPw.length() > 150) {
            newPw = newPw.substring(0, 150);
        }
        log.info("[비번변경] newPw 암호화 : {}", newPw);
        boolean result = mDao.updateNewPw(pw, newPw);
        if (result) {
            log.info("[비번] 업데이트 성공");
            return true;
        } else {
            log.info("[비번] 업데이트 실패");
            return false;
        }
    }
}
