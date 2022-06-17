package com.example.auth.model;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class AuthRequest {

  @NotBlank
  private String username;
  
  @NotBlank
  private String password;

  private String newPassword;

  private String confirmPassword;

  public AuthRequest() {
  }

  public AuthRequest(String username, String password) {
    this.username = username;
    this.password = password;
  }
}
