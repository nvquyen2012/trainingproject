package com.example.module1.controller;

import com.example.module1.dto.LoginUserInfo;
import com.example.module1.dto.PasswordResetInfo;
import com.example.module1.dto.RegisterUserInfo;
import com.example.module1.dto.TokenRefreshInfo;
import com.example.module1.security.jwt.JwtUtils;
import com.example.module1.service.AuthService;
import com.example.module1.service.EmailService;
import com.example.module1.service.impl.authentication.RefreshTokenService;
import com.example.module1.service.impl.registration.ConfirmationTokenService;
import com.example.module1.service.impl.registration.RegistrationService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.ConfirmationToken;
import com.example.trainingbase.entity.auth.RefreshToken;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.payload.BibResponse;
import com.example.module1.payload.JwtResponse;
import freemarker.template.TemplateException;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

@RestController
@RequestMapping(path = "/api/v1/auth")
@AllArgsConstructor
public class AuthController {
    private final RegistrationService registrationService;
    private final ConfirmationTokenService confirmationTokenService;
    private final AuthService authService;
    private final RefreshTokenService refreshTokenService;
    private final EmailService emailService;
    private final JwtUtils jwtUtils;

    @PostMapping(value = "/register")
    public BibResponse register(@RequestBody @Valid RegisterUserInfo request) throws MessagingException, TemplateException, IOException {
        String token = registrationService.register(request);
        String link = "http://localhost:8080/api/v1/auth/confirm?token=" + token;
        emailService.sendMail(request.getEmail(), link);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,(request));
    }

    @PostMapping("/login")
    public JwtResponse authenticateUser(@Valid @RequestBody LoginUserInfo request) {
        return authService.verifyLogin(request);
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

    @GetMapping("/confirm")
    public BibResponse confirm(@RequestParam("token") String token){
        AuthUser authUser = confirmationTokenService.confirmToken(token);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, authUser);
    }

    @GetMapping("/reset")
    public BibResponse resetPasswordOtp(@RequestParam("email") String email) throws MessagingException, TemplateException, IOException {
        String otp = authService.generateOTP(email);
        emailService.sendMail(otp);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,email);
    }

    @PostMapping("/resetpassword")
    public BibResponse resetPassword(@RequestBody @Valid PasswordResetInfo resetInfo) {
        AuthUser authUser = confirmationTokenService.confirmToken(resetInfo.getToken());
        authService.updatePassword(authUser, resetInfo.getPassword());
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE,authUser);
    }
}
