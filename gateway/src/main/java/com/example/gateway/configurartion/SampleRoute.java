package com.example.gateway.configurartion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.factory.TokenRelayGatewayFilterFactory;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SampleRoute {

    @Autowired
    private TokenRelayGatewayFilterFactory filterFactory;

    @Bean
    public RouteLocator dbdRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()
                .route("auth", r -> r.path("/api/v1/auth/**")
                        .filters(f -> f.filters(filterFactory.apply())
                                .removeRequestHeader("Cookie"))
                        .uri("http://localhost:9000"))
                .route("module1", r -> r.path("/api/v1/module1/**").uri("lb://module1"))
                .route("module2", r -> r.path("/api/v1/module2/**").uri("lb://module2"))
                .route("module3", r -> r.path("/api/v1/module3/**").uri("lb://module3"))
                .route("fallback", r -> r.path("/fallback/**").uri("lb://fallback"))
                .build();
    }

}
