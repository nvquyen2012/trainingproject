package com.example.module1.service.impl;

import com.example.module1.dto.RegistrationDTO;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.AuthUserRole;
import com.example.trainingbase.entity.auth.ERoles;
import lombok.AllArgsConstructor;
import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class RegistrationService {

    private AuthUserService authUserService;

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

}
