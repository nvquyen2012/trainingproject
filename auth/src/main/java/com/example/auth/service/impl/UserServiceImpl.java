package com.example.auth.service.impl;

import com.example.auth.mapper.UserMapper;
import com.example.auth.model.SignUpRequest;
import com.example.auth.repository.RoleRepository;
import com.example.auth.repository.UserRepository;
import com.example.auth.service.UserService;
import com.example.trainingbase.dto.UserDto;
import com.example.trainingbase.entity.new_auth.User;
import com.example.trainingbase.service.BasicServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends BasicServiceImpl<User, UserDto> implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder bcryptEncoder;

    private UserMapper userMapper;

    @Autowired
    private ObjectMapper objectMapper;

    public UserServiceImpl(UserRepository userRepository) {
        super(userRepository);
        this.userRepository = userRepository;
    }

    @Override
    public User findById(Long id) {
        return null;
    }

    @Override
    public UserDto create(SignUpRequest signUpRequest){
        User user = objectMapper.convertValue(signUpRequest, User.class);
        user.setPassword(bcryptEncoder.encode(signUpRequest.getPassword()));
        return objectMapper.convertValue(userRepository.saveAndFlush(user), UserDto.class);
    }


}
