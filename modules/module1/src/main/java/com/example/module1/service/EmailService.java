package com.example.module1.service;

import com.example.module1.dto.RegistrationDTO;

import java.util.function.Predicate;

public interface EmailService extends Predicate<String> {
    String register(RegistrationDTO registrationDTO);
    boolean test(String s);
}
