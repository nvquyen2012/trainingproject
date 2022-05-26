package com.example.module1.controller;

import com.example.module1.model.RegistrationRequestDTO;
import com.example.module1.repository.UserRepository;
import com.example.module1.security.jwt.JwtUtils;
import com.example.module1.service.RegistrationService;
import com.example.module1.service.UserService;
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
import java.util.List;

@RestController
@RequestMapping(path = "/api/v1/auth")
@AllArgsConstructor
public class RegistrationController {
    private RegistrationService registrationService;
    private AuthenticationManager authenticationManager;
    private UserRepository userRepository;
    private JwtUtils jwtUtils;

    @PostMapping(value = "/register")
    public BibResponse register(@RequestBody @Valid RegistrationRequestDTO request){
        registrationService.register(request);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,(request));
    }

    @PostMapping("/login")
    public BibResponse authenticateUser(@Valid @RequestBody RegistrationRequestDTO request) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);
//        String email = authentication.getName();
//        AuthUser userDetails = userRepository.findByEmail(email).orElseThrow(()-> null);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,jwt);
    }

}
