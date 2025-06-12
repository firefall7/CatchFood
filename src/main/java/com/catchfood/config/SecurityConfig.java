package com.catchfood.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/", "/register", "/registerProcess", "/login", "/loginSuccess", "/logout", "/css/**", "/js/**", "/images/**").permitAll()
                .anyRequest().permitAll()
            )
            .securityMatcher("/**") 
            .csrf(csrf -> csrf.disable());

        return http.build();
    }
}