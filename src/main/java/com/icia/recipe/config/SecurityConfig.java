package com.icia.recipe.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;

@Configuration
@EnableWebSecurity
//메소드 레벨의 보안을 구성하고 @PreAuthorize, @PostAuthorize, @Secured 등의
//어노테이션을 사용하여 메소드에 대한 접근 제어를 지원
//prePostEnabled=true 생략 가능
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
@Slf4j
public class SecurityConfig {
    @Autowired
    private AccessDeniedHandler accessDeniedHandler;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        //http.csrf().disable().cors().disable(); //2.X 버전 방식
        //http.csrf(csrf->csrf.disable());
        //http.cors(cors->cors.disable());
        http.csrf(AbstractHttpConfigurer::disable);
        http.cors(AbstractHttpConfigurer::disable);
        http.formLogin(form -> form.loginPage("/member/login").loginProcessingUrl("/member/login")
                        .defaultSuccessUrl("/").failureUrl("/member/login/error") //기본값:/member/login
                //.usernameParameter("id") //기본값: username
                //.passwordParameter("pw") //기본값: password
                //.permitAll()
        );
        //get,post 방식 /member/logout 요청 가능
        http.logout(logout -> logout.logoutUrl("/member/logout").logoutSuccessUrl("/"));
        http.exceptionHandling(hedler -> hedler.accessDeniedHandler(accessDeniedHandler));
        return http.build();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}//class end
