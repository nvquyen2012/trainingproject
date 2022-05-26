package com.example.module1.controller;

import com.example.module1.service.UserService;
import com.example.trainingbase.entity.auth.AuthUser;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/api/v1/user")
@AllArgsConstructor
public class UserController {
    private UserService userService;

    @GetMapping
    public AuthUser findById(@RequestParam(name = "id") Integer Id){
        return userService.findById(Id);
    }

}
