package com.example.module1.service.impl;

import com.example.module1.dto.RegistrationDTO;
import com.example.module1.repository.AuthUserRepository;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.ConfirmationToken;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@AllArgsConstructor
public class AuthUserService implements UserDetailsService {

    @Autowired
    private final AuthUserRepository authUserRepository;

    private static final String USER_NOT_FOUND = "user with email %s not found";

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    private final ConfirmationTokenService confirmationTokenService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return authUserRepository.findByEmail(email)
                .orElseThrow(()-> new UsernameNotFoundException(String.format(USER_NOT_FOUND, email)));
    }

    public String signUpUser(AuthUser authUser){
        boolean userExists = authUserRepository.findByEmail(authUser.getEmail())
                .isPresent();
        if (userExists) {
           throw new IllegalStateException("email already taken");
        }
        String encodedPassword=bCryptPasswordEncoder.encode(authUser.getPassword());
        authUser.setPassword(encodedPassword);
        authUserRepository.save(authUser);
        //Send confirm token
        String token = UUID.randomUUID().toString();
        ConfirmationToken confirmationToken =new ConfirmationToken(
                token,
                LocalDateTime.now(),
                LocalDateTime.now().plusMinutes(15),
                authUser
        );
        confirmationTokenService.saveConfirmationToken(confirmationToken);
        return token;
    }


}
