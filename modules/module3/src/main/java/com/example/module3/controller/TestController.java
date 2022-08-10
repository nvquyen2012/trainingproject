package com.example.module3.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/module3/test")
public class TestController {

    @GetMapping
    public String hello() {
        return "Hello from module 3";
    }
}
