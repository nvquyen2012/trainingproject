package com.example.module1.model;

import lombok.*;

@Data
@AllArgsConstructor
public class RegistrationRequest {
    private final String email;
    private final String phoneNumber;
    private final String fullName;
    private final String companyId;
    private final String roles;
    private final String password;
}
