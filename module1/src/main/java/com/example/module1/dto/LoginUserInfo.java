package com.example.module1.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Data
@AllArgsConstructor
public class LoginUserInfo {
    @NotBlank(message = "Email is mandatory")
    @NotEmpty(message = "Email is mandatory")
    private final String email;

    @NotBlank(message = "Password is mandatory")
    @NotEmpty(message = "Password is mandatory")
    private final String password;

}
