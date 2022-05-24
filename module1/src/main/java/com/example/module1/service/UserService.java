package com.example.module1.service;

import com.example.module1.repository.UserRepository;
import com.example.trainingbase.entity.auth.AuthUser;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import static com.example.trainingbase.constants.ConstantDefault.STATUS_NOT_OK;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public AuthUser loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException(STATUS_NOT_OK));
    }
}
