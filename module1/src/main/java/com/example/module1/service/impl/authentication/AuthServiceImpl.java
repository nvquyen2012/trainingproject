package com.example.module1.service.impl.authentication;

import com.example.module1.dto.LoginUserInfo;
import com.example.module1.payload.JwtResponse;
import com.example.module1.repository.UserRepository;
import com.example.module1.security.jwt.JwtUtils;
import com.example.module1.service.AuthService;
import com.example.module1.service.impl.LoginInfoService;
import com.example.module1.service.impl.registration.ConfirmationTokenService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.ConfirmationToken;
import com.example.trainingbase.entity.auth.EStatus;
import com.example.trainingbase.entity.auth.RefreshToken;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.payload.BibResponse;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.UUID;

@Service
@AllArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;
    private final LoginInfoService loginInfoService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final JwtUtils jwtUtils;
    private final RefreshTokenService refreshTokenService;
    private final ConfirmationTokenService confirmationTokenService;

    @Override
    @Transactional
    public BibResponse verifyUser(Integer id, String decision) {
        AuthUser authUser = userRepository.findById(id).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_USER_ID_CODE, "Invalid User Id")
        );
        if(!authUser.getStatus().equals(EStatus.PENDING.name())){
            throw new BusinessException(HttpStatusConstants.STATUS_INVALID_CODE, "User already verified");
        }
        authUser.setStatus(decision);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, authUser);
    }

    @Override
    @Transactional
    public JwtResponse verifyLogin(LoginUserInfo request) {
        AuthUser authUser = userRepository.findByEmail(request.getEmail()).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.EMAIL_NOT_EXISTS_CODE, "Email not existed")
        );
        if (authUser.getLoginFailCount() > 3) {
            loginInfoService.saveFailedLog(authUser);
            userRepository.setStatus(authUser.getId(), EStatus.REJECTED.name());
            throw new BusinessException(HttpStatusConstants.INVALID_PASSWORD_CODE, "Exceeds password limit count, account" +
                    "rejected. Please contact the admin");
        }
        if(!passwordEncoder.matches(request.getPassword(), authUser.getPassword())){
            userRepository.saveFailedLogin(authUser.getId(), authUser.getLoginFailCount()+1);
            throw new BusinessException(HttpStatusConstants.INVALID_PASSWORD_CODE, "Wrong password");
        }
        if(EStatus.REJECTED.name().equals(authUser.getStatus()) || EStatus.INACTIVE.name().equals(authUser.getStatus())){
            throw new BusinessException(HttpStatusConstants.STATUS_INVALID_CODE, "Account is rejected or inactive");
        }

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(request.getEmail());
        RefreshToken refreshToken = refreshTokenService.createRefreshToken(authUser.getId());
        loginInfoService.saveSuccessfulLog(authUser);
        userRepository.resetLoginFailCount(authUser.getId());
        return new JwtResponse(jwt,refreshToken.getToken(), authUser.getEmail(), authUser.getRole());
    }

    @Override
    public String generateOTP(String email){
        AuthUser authUser = userRepository.findByEmail(email).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.EMAIL_NOT_EXISTS_CODE,
                        HttpStatusConstants.EMAIL_NOT_EXISTS_MESSAGE)
        );
        String token = UUID.randomUUID().toString();
        String otp = token.substring(0,4);
        ConfirmationToken confirmationToken = new ConfirmationToken(otp, LocalDateTime.now(),
                LocalDateTime.now().plusMinutes(10),
                authUser);
        confirmationTokenService.saveConfirmationToken(confirmationToken);
        return otp;
    }

    @Override
    @Transactional
    public void updatePassword(AuthUser authUser, String password) {
        String hash = passwordEncoder.encode(password);
        userRepository.setPassword(authUser.getId(), hash);
    }
}
