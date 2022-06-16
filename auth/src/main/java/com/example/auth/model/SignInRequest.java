package com.example.auth.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

@Data
public class SignInRequest {

  @NotBlank
  private String username;
  
  @NotBlank
  private String password;
  
}
