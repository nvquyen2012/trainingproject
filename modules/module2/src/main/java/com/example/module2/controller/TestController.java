package com.example.module2.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/module2/test")
public class TestController {

    @GetMapping
    public String hello() {
        return "Hello from module 2";
    }
}
