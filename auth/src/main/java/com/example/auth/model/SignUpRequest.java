package com.example.auth.model;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Set;

@Data
public class SignUpRequest {

  private Long id;

  @NotBlank
  @Size(min = 2, max = 20)
  private String username;

  @NotBlank
  @Size(min = 10, max = 10)
  private String phone;

  @NotBlank
  private String fullname;

  @NotBlank
  @Size(min = 5, max = 50)
  @Email
  private String email;

  private Set<String> roles;

  private String status;

  @NotBlank
  @Size(min = 5, max = 100)
  private String address;

  @NotBlank
  @Size(min = 6, max = 120)
  private String password;
}
