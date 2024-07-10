package com.icia.recipe.dao;

import com.icia.recipe.dto.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MemberDao {
    @Insert("insert into member values (#{m_id},#{m_pw},#{m_name},#{m_address},#{m_phone},default,default)")
    boolean join(Member member);

    @Select("select * from member where m_id=#{m_id}")
    String check(Member member);

    @Select("select * from member where m_id=#{m_id}")
    Member getMemberInfo(String username);

    @Select("select m_pw from member where m_id=#{m_id}")
    String getSecurityPw(String mId);

    @Select("select m_id from member where m_name=#{m_name} and m_phone=#{m_phone}")
    String searchid(Member member);

    @Select("select m_id from member where m_id=#{m_id} and m_name=#{m_name} and m_phone=#{m_phone}")
    String searchpw(Member member);

    @Update("update member set m_pw=#{m_pw} where m_id=#{m_id}")
    boolean changepw(Member member);

    @Select("select m_id from member where m_id=#{m_id} and m_name=#{m_name} and m_phone=#{m_phone}")
    String passwordRecovery(Member member);
}
