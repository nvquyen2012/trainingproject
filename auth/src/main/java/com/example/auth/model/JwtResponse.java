package com.example.auth.model;

import com.example.trainingbase.dto.UserDto;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Data
public class JwtResponse {

  @JsonProperty("id_token")
  private String idToken;
  
  @JsonProperty("userInfo")
  private UserDto userInfo;
}
