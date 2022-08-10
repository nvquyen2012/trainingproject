package com.example.trainingbase.dto;

import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
public class UserDto extends BasicDTO {

  private Long id;

  private String username;

  private String password;

  private String email;

  private String phone;

  private String fullname;

  private String status;

  private Set<String> roles = new HashSet<>();

  private String address;

  private String profileImagePath;

}
