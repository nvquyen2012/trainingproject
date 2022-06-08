package com.example.module1.service.impl;

import com.example.module1.dto.RegistrationDTO;
import com.example.module1.repository.ConfirmationTokenRepository;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.*;
import com.example.trainingbase.exceptions.BusinessException;
import lombok.AllArgsConstructor;
import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;

@Service
@AllArgsConstructor
public class RegistrationService {

    private AuthUserService authUserService;

    private final ConfirmationTokenService confirmationTokenService;
    private final ConfirmationTokenRepository confirmationTokenRepository;

    public String register(RegistrationDTO registrationDTO) {
        return authUserService.signUpUser(
                new AuthUser(
                        registrationDTO.getEmail(),
                        registrationDTO.getPhoneNumber(),
                        registrationDTO.getCompanyId(),
                        registrationDTO.getFullName(),
                        registrationDTO.getRole(),
                        registrationDTO.getPassword()
                )
        );
    }

    @Transactional
    public AuthUser  confirmToken(String token) {
        ConfirmationToken confirmationToken = confirmationTokenRepository
                .findByToken(token)
                .orElseThrow(() ->
                        new BusinessException(HttpStatusConstants.INVALID_DATA_CODE, "There is no confirmation token"));

        if (confirmationToken.getConfirmedAt() != null) {
            throw new IllegalStateException("email already confirmed");
        }

        LocalDateTime expiredAt = confirmationToken.getExpiredAt();

        if (expiredAt.isBefore(LocalDateTime.now())) {
            throw new IllegalStateException("token expired");
        }

        confirmationToken.getAuthUser().setStatus(EStatus.PENDING.name());
        confirmationTokenRepository.updateConfirmedAt(token, LocalDateTime.now());
        return confirmationToken.getAuthUser();

    }





}
