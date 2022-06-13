package com.example.module1.config;

import com.example.trainingbase.interceptor.TestInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ImpInterceptor extends TestInterceptor {

    @Value("${test.enable}")
    public void setTestEnable(boolean testEnable){
        super.testEnable = testEnable;
    }
}
