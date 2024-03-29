package com.example.mybatisoraclesetting;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.example.mybatisoraclesetting.blogs.**.mapperDao")
public class MybatisOracleSettingApplication {
    public static void main(String[] args) {
        SpringApplication.run(MybatisOracleSettingApplication.class, args);
    }

}
