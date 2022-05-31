package com.example.module1.service.impl;

import com.example.module1.model.RegisterUserInfo;
import com.example.module1.repository.ConfirmationTokenRepository;
import com.example.module1.security.EmailValidator;
import com.example.module1.service.UserService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.ConfirmationToken;
import com.example.trainingbase.entity.auth.EStatus;
import com.example.trainingbase.exceptions.BusinessException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

import java.time.LocalDateTime;

import static com.example.trainingbase.constants.ConstantDefault.STATUS_NOT_OK;

@Service
@AllArgsConstructor
public class RegistrationService {
    private final EmailValidator emailValidator;
    private final UserService userService;
    private final ConfirmationTokenRepository confirmationTokenRepository;
    public String register(RegisterUserInfo request) {
        boolean isValidEmail = emailValidator.test(request.getEmail());
        if(!isValidEmail){
            throw new BusinessException(HttpStatusConstants.EMAIL_EXIST_CODE, HttpStatusConstants.EMAIL_EXIST_MESSAGE);
        }
        if(!(request.getPassword().equals(request.getRPassword()))){
            throw new BusinessException(HttpStatusConstants.INVALID_PASSWORD_CODE, "Password must match the current password");
        }
        return userService.signUpUser(new AuthUser(
                request.getFullName(),
                request.getEmail(),
                request.getPassword(),
                request.getPhoneNumber(),
                request.getRoles(),
                request.getCompanyId()
        ));
    }

    @Transactional
    public void confirmToken(String token){
        ConfirmationToken confirmationToken = confirmationTokenRepository.findByToken(token).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_DATA_CODE, "There is no confirmation token")
        );
        if(confirmationToken.getConfirmedAt() != null){
            throw new BusinessException(HttpStatusConstants.INVALID_DATA_CODE, "Token already confirmed");
        }

        LocalDateTime expiredAt = confirmationToken.getExpiresAt();

        if(expiredAt.isBefore(LocalDateTime.now())){
            throw new BusinessException(HttpStatusConstants.INVALID_DATA_CODE, "Token already expired");
        }
        confirmationToken.getAuthUser().setStatus(EStatus.PENDING.name());
        confirmationTokenRepository.updateConfirmedAt(token, LocalDateTime.now());
    }
}
