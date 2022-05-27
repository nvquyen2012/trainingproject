package com.example.module1.service.impl;

import com.example.module1.model.RegisterUserInfo;
import com.example.module1.security.EmailValidator;
import com.example.trainingbase.entity.auth.AuthUser;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import static com.example.trainingbase.constants.ConstantDefault.STATUS_NOT_OK;

@Service
@AllArgsConstructor
public class RegistrationService {
    private final EmailValidator emailValidator;
    private final UserDetailsServiceImpl userDetailsServiceImpl;
    public String register(RegisterUserInfo request) {
        boolean isValidEmail = emailValidator.test(request.getEmail());
        if(!isValidEmail){
            throw new IllegalStateException(STATUS_NOT_OK);
        }
        if(!(request.getPassword().equals(request.getRPassword()))){
            throw new IllegalStateException(STATUS_NOT_OK);
        }
        return userDetailsServiceImpl.signUpUser(new AuthUser(
                request.getFullName(),
                request.getEmail(),
                request.getPassword(),
                request.getPhoneNumber(),
                request.getRoles(),
                request.getCompanyId()
        ));
    }
}
