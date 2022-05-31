package com.example.module1.controller;

import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/module1/test")
public class TestController {

    private static final String MODULE2_SERVICE_NAME = "module2";

    @Autowired
    private EurekaClient eurekaClient;

    @GetMapping
    public String hello() {
        return "Hello from module 1";
    }

    @GetMapping("/t2")
    public String helloFromModule2() {
        InstanceInfo serviceInfo = eurekaClient.getApplication(MODULE2_SERVICE_NAME).getInstances().get(0);

        URI url = URI.create("http://" + serviceInfo.getHostName() + ":" + serviceInfo.getPort() + "/api/v1/module2/test");
        return new RestTemplate().getForObject(url, String.class);

    }
}
