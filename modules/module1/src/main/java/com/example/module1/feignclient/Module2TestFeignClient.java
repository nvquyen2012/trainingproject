package com.example.module1.feignclient;

import com.example.module1.config.FeignClientConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "module2-test", configuration = FeignClientConfig.class)
public interface Module2TestFeignClient {

    @GetMapping(value = "/api/v1/module2/test")
    String hello();

}
