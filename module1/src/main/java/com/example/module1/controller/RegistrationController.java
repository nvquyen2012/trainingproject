package com.example.module1.controller;

import com.example.module1.model.RegisterUserInfo;
import com.example.module1.repository.UserRepository;
import com.example.module1.security.jwt.JwtUtils;
import com.example.module1.service.impl.RegistrationService;
import com.example.module1.service.impl.UserDetailsServiceImpl;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.payload.BibResponse;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(path = "/api/v1/auth")
@AllArgsConstructor
public class RegistrationController {
    private RegistrationService registrationService;
    private AuthenticationManager authenticationManager;
    private JwtUtils jwtUtils;
    private UserDetailsServiceImpl userDetailsService;

    @PostMapping(value = "/register")
    public BibResponse register(@RequestBody @Valid RegisterUserInfo request){
        registrationService.register(request);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,(request));
    }

    @PostMapping("/login")
    public BibResponse authenticateUser(@Valid @RequestBody RegisterUserInfo request) {
        userDetailsService.verifyLogin(request);
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,jwt);
    }

}
