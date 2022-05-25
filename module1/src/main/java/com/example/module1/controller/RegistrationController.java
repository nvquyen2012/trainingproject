package com.example.module1.controller;

import com.example.module1.model.RegistrationRequest;
import com.example.module1.service.RegistrationService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.Validation;

@RestController
@RequestMapping(path = "/api/v1/auth")
@AllArgsConstructor
public class RegistrationController {
    private RegistrationService registrationService;

    @PostMapping(value = "/register")
    public String register(@RequestBody @Valid RegistrationRequest request){
        return registrationService.register(request);
    }
}
