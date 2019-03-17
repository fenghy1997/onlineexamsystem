package com.zetta.onlineexamsystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching
@SpringBootApplication
@MapperScan("com.zetta.onlineexamsystem.mapper")
public class OnlineExamSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(OnlineExamSystemApplication.class, args);
    }
}
