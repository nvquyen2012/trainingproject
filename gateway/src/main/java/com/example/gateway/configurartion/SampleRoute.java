package com.example.gateway.configurartion;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SampleRoute {

    @Bean
    public RouteLocator dbdRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()
                .route("module1", r -> r.path("/api/v1/module1/**").uri("lb://module1"))
                .route("module2", r -> r.path("/api/v1/module2/**").uri("lb://module2"))
                .route("module3", r -> r.path("/api/v1/module3/**").uri("lb://module3"))
                .route("fallback", r -> r.path("/fallback/**").uri("lb://fallback"))
                .build();
    }
}
