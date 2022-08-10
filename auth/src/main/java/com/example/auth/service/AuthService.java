package com.example.auth.service;

import com.example.auth.model.AuthRequest;
import com.example.trainingbase.dto.UserDto;
import com.example.trainingbase.entity.new_auth.User;
import com.example.trainingbase.entity.auth.TrainingUser;
import com.example.trainingbase.service.BasicService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface AuthService extends BasicService<User, UserDto>, UserDetailsService {

    @Override
    TrainingUser loadUserByUsername(String username);

    TrainingUser getUserByUsername(String name);

    ResponseEntity<?> changePassword(AuthRequest request);
}
