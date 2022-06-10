package com.example.module1.controller;

import com.example.module1.dto.RegistrationDTO;
import com.example.module1.service.impl.AuthUserService;
import com.example.module1.service.impl.EmailServiceImpl;
import com.example.module1.service.impl.RegistrationService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.payload.BibResponse;
import freemarker.template.TemplateException;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.io.IOException;

@RestController
@RequestMapping("api/v1/auth")
@AllArgsConstructor
public class AuthController {

    @Autowired
    private final AuthUserService authUserService;
    private final EmailServiceImpl emailService;


    private final RegistrationService registrationService;

    @PostMapping("/registration")
    public BibResponse register(@RequestBody @Valid RegistrationDTO registrationDTO) throws MessagingException, TemplateException, IOException {
        String token = registrationService.register(registrationDTO);
        String link = "http://localhost:8080/api/v1/auth/confirm?token=" + token;
        emailService.sendMail(registrationDTO.getEmail(), link);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, registrationDTO);
    }
    @GetMapping("confirm")
    public BibResponse confirm(@RequestParam("token") String token){
        AuthUser authUser = registrationService.confirmToken(token);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, authUser);
    }


}
