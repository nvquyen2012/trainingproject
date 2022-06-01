package com.example.module1.service;

import com.example.module1.dto.LoginUserInfo;
import com.example.module1.payload.JwtResponse;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.payload.BibResponse;

import javax.transaction.Transactional;

public interface AuthService {

    BibResponse verifyUser(Integer id, String decision);
    JwtResponse verifyLogin(LoginUserInfo request);

    String generateOTP(String email);

    void updatePassword(AuthUser authUser, String password);
}
