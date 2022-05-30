package com.example.module1.service.impl;

import com.example.module1.model.LoginUserInfo;
import com.example.module1.model.RegisterUserInfo;
import com.example.module1.repository.UserRepository;
import com.example.module1.security.PasswordEncoder;
import com.example.module1.service.AuthService;
import com.example.trainingbase.constants.ConstantDefault;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.EStatus;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.payload.BibResponse;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@AllArgsConstructor
public class AuthServiceImpl implements AuthService {
    private UserRepository userRepository;
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public BibResponse verifyUser(Integer id, String decision) {
        AuthUser authUser = userRepository.findById(id).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_USER_ID_CODE, HttpStatusConstants.INVALID_USER_ID_MESSAGE)
        );
        if(!authUser.getStatus().equals(EStatus.PENDING.name())){
            throw new BusinessException(HttpStatusConstants.STATUS_INVALID_CODE, HttpStatusConstants.STATUS_INVALID_MESSAGE);
        }
        authUser.setStatus(decision);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, authUser);
    }
    @Override
    @Transactional
    public void verifyLogin(LoginUserInfo request) {
        AuthUser authUser = userRepository.findByEmail(request.getEmail()).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.EMAIL_NOT_EXISTS_CODE, HttpStatusConstants.EMAIL_NOT_EXISTS_MESSAGE)
        );
        if(EStatus.REJECTED.name().equals(authUser.getStatus())){
            throw new BusinessException(HttpStatusConstants.STATUS_INVALID_CODE, HttpStatusConstants.STATUS_INVALID_MESSAGE);
        }
    }
}
