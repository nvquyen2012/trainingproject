package com.example.auth.model;

import com.example.trainingbase.dto.UserDto;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Data
public class JwtResponse {

  @JsonProperty("token")
  private String token;
  
  @JsonProperty("userInfo")
  private UserDto userInfo;
}
