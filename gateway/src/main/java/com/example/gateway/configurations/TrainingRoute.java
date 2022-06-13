package com.example.gateway.configurations;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TrainingRoute {

    @Bean
    public RouteLocator dbdRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()
                .route("training-module1", r -> r.path("/api/v1/module1/**").uri("lb://module1"))
                .route("training-module2", r -> r.path("/api/v1/module2/**").uri("lb://module2"))
                .route("training-module3", r -> r.path("/api/v1/module3/**").uri("lb://module3"))
                .build();
    }
}
