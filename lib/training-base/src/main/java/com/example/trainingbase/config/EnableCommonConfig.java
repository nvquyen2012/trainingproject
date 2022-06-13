package com.example.trainingbase.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ComponentScan({"com.example.trainingbase.interceptor"})
@PropertySource(value = {"classpath:application.properties"})
public class EnableCommonConfig {
}
