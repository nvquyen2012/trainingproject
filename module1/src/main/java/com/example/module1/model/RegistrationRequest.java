package com.example.module1.model;

import lombok.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
public class RegistrationRequest {
    @NotBlank(message = "Email is mandatory")
    @NotEmpty(message = "Email is mandatory")
    private final String email;

    @NotBlank(message = "Phone number is mandatory")
    @NotEmpty(message = "Phone number is mandatory")
    private final String phoneNumber;

    @NotBlank(message = "Full name is mandatory")
    @NotEmpty(message = "Full name is mandatory")
    private final String fullName;

    @NotNull(message = "Company is mandatory")
    private final Integer companyId;

    @NotBlank(message = "Role is mandatory")
    @NotEmpty(message = "Role is mandatory")
    private final String roles;

    //TODO: password validation
    @NotBlank(message = "Password is mandatory")
    @NotEmpty(message = "Password is mandatory")
    @Pattern(regexp = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$")
    private final String password;

    @NotBlank(message = "Repeat your password")
    @NotEmpty(message = "Repeat your password")
    private final String rPassword;


}
