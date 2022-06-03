package com.example.module1.controller;

import com.example.module1.dto.RegistrationDTO;
import com.example.module1.service.impl.AuthUserService;
import com.example.module1.service.impl.RegistrationService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/auth")
@AllArgsConstructor
public class AuthController {

    @Autowired
    private final AuthUserService authUserService;

    private final RegistrationService registrationService;

    @PostMapping("/registration")
    public String register(@RequestBody RegistrationDTO registrationDTO){
        return registrationService.register(registrationDTO);
    }
}
