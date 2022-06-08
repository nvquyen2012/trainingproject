package com.example.module1.controller;

import com.example.module1.dto.RegistrationDTO;
import com.example.module1.service.impl.AuthUserService;
import com.example.module1.service.impl.ConfirmationTokenService;
import com.example.module1.service.impl.RegistrationService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.payload.BibResponse;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    @GetMapping("confirm")
    public BibResponse confirm(@RequestParam("token") String token){
        AuthUser authUser = registrationService.confirmToken(token);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, authUser);
    }


}
