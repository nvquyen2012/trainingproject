package com.example.module1.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Data
@AllArgsConstructor
public class PasswordResetInfo {
    @NotBlank(message = "Token is mandatory")
    @NotEmpty(message = "Token is mandatory")
    private final String token;

    @NotBlank(message = "Password is mandatory")
    @NotEmpty(message = "Password is mandatory")
    private final String password;
}
