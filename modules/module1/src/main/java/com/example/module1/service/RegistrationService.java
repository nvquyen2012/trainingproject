package com.example.module1.service;

import com.example.module1.dto.RegistrationDTO;
import org.springframework.stereotype.Service;

@Service
public class RegistrationService {
    public String register(RegistrationDTO registrationDTO) {
        return "It works";
    }
}
