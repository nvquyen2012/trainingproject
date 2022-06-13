package com.example.module1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.web.client.RestTemplate;

@Configuration
//@PropertySources({@PropertySource("application-mysql.properties")})
public class BasicConfig {

    @Bean
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }
}
