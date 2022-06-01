package com.example.module1.service.impl;

import com.example.module1.repository.LoginInfoRepository;
import com.example.trainingbase.entity.auth.AuthLoginLog;
import com.example.trainingbase.entity.auth.AuthUser;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Service
@AllArgsConstructor
public class LoginInfoService {
    private final LoginInfoRepository loginInfoRepository;

    public void saveFailedLog(AuthUser authUser) {
        AuthLoginLog authLoginLog = new AuthLoginLog(
                authUser.getId(), "FAIL", Timestamp.valueOf(LocalDateTime.now()), authUser.getFullName()
        );
        loginInfoRepository.save(authLoginLog);
    }

    public void saveSuccessfulLog(AuthUser authUser){
        AuthLoginLog authLoginLog = new AuthLoginLog(
                authUser.getId(), "OK", Timestamp.valueOf(LocalDateTime.now()), authUser.getFullName()
        );
        loginInfoRepository.save(authLoginLog);
    }
}
