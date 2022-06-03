package com.example.module1.service.impl;

import com.example.module1.dto.RegistrationDTO;
import com.example.module1.service.EmailService;
import lombok.AllArgsConstructor;
import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.stereotype.Service;

import java.util.function.Predicate;

@Service
@AllArgsConstructor
public class EmailServiceImpl implements Predicate<String> {


    @Override
    public boolean test(String s) {
        return true;
    }
}
