package com.example.auth.service;

import com.example.auth.model.SignUpRequest;
import com.example.trainingbase.dto.UserDto;
import com.example.trainingbase.entity.new_auth.User;
import com.example.trainingbase.service.BasicService;

public interface UserService extends BasicService<User, UserDto> {

    User findById(Long id);

    UserDto create(SignUpRequest request);
}
