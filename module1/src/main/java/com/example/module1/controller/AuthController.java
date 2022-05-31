package com.example.module1.controller;

import com.example.module1.model.LoginUserInfo;
import com.example.module1.model.RegisterUserInfo;
import com.example.module1.model.TokenRefreshInfo;
import com.example.module1.repository.UserRepository;
import com.example.module1.security.jwt.JwtUtils;
import com.example.module1.service.AuthService;
import com.example.module1.service.impl.RefreshTokenService;
import com.example.module1.service.impl.RegistrationService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.RefreshToken;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.payload.BibResponse;
import com.example.module1.payload.JwtResponse;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/v1/auth")
@AllArgsConstructor
public class AuthController {
    private AuthenticationManager authenticationManager;
    private JwtUtils jwtUtils;
    private RegistrationService registrationService;
    private AuthService authService;
    private UserRepository userRepository;
    private RefreshTokenService refreshTokenService;

    //TODO: Logging user information
    @PostMapping(value = "/register")
    public BibResponse register(@RequestBody @Valid RegisterUserInfo request){
        registrationService.register(request);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,(request));
    }

    @PostMapping("/login")
    public JwtResponse authenticateUser(@Valid @RequestBody LoginUserInfo request) {
        authService.verifyLogin(request);
        AuthUser authUser = userRepository.findByEmail(request.getEmail()).get();
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        //authentication.getPrincipal()
        String jwt = jwtUtils.generateJwtToken(authUser.getEmail());
        RefreshToken refreshToken = refreshTokenService.createRefreshToken(authUser.getId());
        return new JwtResponse(jwt,refreshToken.getToken(), authUser.getEmail(), authUser.getRole());
    }

    @PostMapping("/refreshtoken")
    public JwtResponse refreshToken(@Valid @RequestBody TokenRefreshInfo request){
        String requestRefreshToken = request.getRefreshToken();
        return refreshTokenService.findByToken(requestRefreshToken)
                .map(refreshTokenService::verifyExpiration)
                .map(RefreshToken::getAuthUser)
                .map(authUser -> {
                    RefreshToken refreshToken = refreshTokenService.createRefreshToken(authUser.getId());
                    String token = jwtUtils.generateJwtToken(authUser.getEmail());
                    return new JwtResponse(token, refreshToken.getToken());
                }).orElseThrow(
                        () -> new BusinessException(HttpStatusConstants.UNAUTHORIZED_CODE, HttpStatusConstants.UNAUTHORIZED_MESSAGE)
                );
    }
}
