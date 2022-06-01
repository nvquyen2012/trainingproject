package com.example.module1.service;

import com.example.module1.model.LoginUserInfo;
import com.example.module1.payload.JwtResponse;
import com.example.trainingbase.payload.BibResponse;

import javax.transaction.Transactional;

public interface AuthService {

    @Transactional
    BibResponse verifyUser(Integer id, String decision);

    @Transactional
    JwtResponse verifyLogin(LoginUserInfo request);
}
