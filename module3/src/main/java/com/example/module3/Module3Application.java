package com.example.module3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(scanBasePackages = {"com.example.module3","com.example.trainingbase"})
@EntityScan("com.example.trainingbase")
public class Module3Application {

    public static void main(String[] args) {
        SpringApplication.run(Module3Application.class, args);
    }

}
