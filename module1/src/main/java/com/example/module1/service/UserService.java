package com.example.module1.service;

import com.example.module1.dto.RegisterUserInfo;
import com.example.module1.repository.specification.FilterInfo;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.payload.BibResponse;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    UserDetails loadUserByUsername (String email);
    String signUpUser(AuthUser authUser);
    AuthUser findById(Integer Id);
    AuthUser findByEmail(String Id);
    AuthUser findByCompanyId(Integer Id);
    void deleteById(Integer Id);
    void deleteByEmail(String email);
    BibResponse updateUserById(Integer id, RegisterUserInfo registerUserInfo);
    BibResponse updateUserRoleById(Integer id, String role);
    BibResponse updateUserCompanyById(Integer id, Integer companyId);
    List<AuthUser> findUser(List<FilterInfo> filterInfos);
}
