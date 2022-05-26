package com.example.module1.service;

import com.example.module1.repository.UserRepository;
import com.example.trainingbase.entity.auth.AuthUser;
import lombok.AllArgsConstructor;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import static com.example.trainingbase.constants.ConstantDefault.STATUS_NOT_OK;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException(STATUS_NOT_OK));
    }

//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        AuthUser authUser = userRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException(STATUS_NOT_OK));
//        return User.builder()
//                .username(authUser.getEmail())
//                .password(authUser.getPassword())
//                .authorities(AuthorityUtils.createAuthorityList(authUser.getRole()))
//                .build();
//    }

    public String signUpUser(AuthUser authUser){
        boolean userExisted = userRepository.findByEmail(authUser.getEmail()).isPresent();
        if(userExisted){
            throw new IllegalStateException("This email address is used before");
        }
        String encodedPassword = bCryptPasswordEncoder.encode(authUser.getPassword());
        authUser.setPassword(encodedPassword);
        userRepository.save(authUser);
        //TODO: send confirmation token
        return "";
    }

    public AuthUser findById(Integer Id){
        AuthUser authUser = userRepository.findById(Id).orElseThrow(
                () -> new IllegalStateException(STATUS_NOT_OK)
        );
        return authUser;
    }

}
