package com.example.auth.service.impl;

import com.example.auth.model.AuthRequest;
import com.example.auth.repository.UserRepository;
import com.example.auth.service.AuthService;
import com.example.trainingbase.dto.UserDto;
import com.example.trainingbase.entity.new_auth.User;
import com.example.trainingbase.entity.auth.TrainingUser;
import com.example.trainingbase.service.BasicServiceImpl;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl extends BasicServiceImpl<User, UserDto> implements AuthService {

    private UserRepository userRepository;

    public AuthServiceImpl(UserRepository userRepository) {
        super(userRepository);
        this.userRepository = userRepository;
    }

    @Override
    public TrainingUser loadUserByUsername(String username) {
        return null;
    }

    @Override
    public TrainingUser getUserByUsername(String name) {
        return null;
    }

    @Override
    public ResponseEntity<?> changePassword(AuthRequest request) {
        return null;
    }
}
