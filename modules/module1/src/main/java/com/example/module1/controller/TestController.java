package com.example.module1.controller;

import com.example.module1.entity.User;
import com.example.module1.repository.UserRepository;
import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/module1/test")
public class TestController {

    private static final String MODULE2_SERVICE_NAME = "module2";

    @Autowired
    private EurekaClient eurekaClient;

    @Autowired
    private UserRepository userRepository;

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

    @PostMapping("/user")
    public ResponseEntity<User> createBank(@RequestBody User req) {

        User user = userRepository.save(req);
        return ResponseEntity.ok(user);
    }
}
