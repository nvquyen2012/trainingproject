package com.example.module1.dto;

import lombok.Data;

@Data
public class RegistrationDTO {
    private String email;
    private String phoneNumber;
    private Integer companyId;
    private String fullName;
    private String role;
    private String password;
}
