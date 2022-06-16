package com.example.module1.config;

import feign.auth.BasicAuthRequestInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignClientConfig {

    public BasicAuthRequestInterceptor basicAuthRequestInterceptor(@Value("{module2.user.name}") String name, @Value("{module2.user.password}") String password) {
        return new BasicAuthRequestInterceptor(name, password);
    }
}
