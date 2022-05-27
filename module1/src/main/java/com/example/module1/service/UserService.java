package com.example.module1.service;

import com.example.module1.model.RegisterUserInfo;
import com.example.trainingbase.entity.auth.AuthUser;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import javax.transaction.Transactional;

public interface UserService extends UserDetailsService {
    UserDetails loadUserByUsername (String email);
    String signUpUser(AuthUser authUser);
    AuthUser findById(Integer Id);
    AuthUser findByEmail(String Id);
    AuthUser findByCompanyId(Integer Id);
    void deleteById(Integer Id);
    void deleteByEmail(String email);
    void updateUserById(Integer id, RegisterUserInfo registerUserInfo);
    void updateUserRoleById(Integer id, String role);
    void updateUserCompanyById(Integer id, Integer companyId);
    void verifyUser(Integer id, String decision);
}
