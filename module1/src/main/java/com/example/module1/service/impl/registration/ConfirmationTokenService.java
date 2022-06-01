package com.example.module1.service.impl.registration;

import com.example.module1.repository.ConfirmationTokenRepository;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.ConfirmationToken;
import com.example.trainingbase.entity.auth.EStatus;
import com.example.trainingbase.exceptions.BusinessException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;

@Service
@AllArgsConstructor
public class ConfirmationTokenService {
    private final ConfirmationTokenRepository confirmationTokenRepository;

    public void saveConfirmationToken(ConfirmationToken token){
        confirmationTokenRepository.save(token);
    }

    @Transactional
    public AuthUser confirmToken(String token){
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
        return confirmationToken.getAuthUser();
    }
}
