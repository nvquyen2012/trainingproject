package com.example.module1.controller;

import com.example.module1.model.RegisterUserInfo;
import com.example.module1.repository.UserRepository;
import com.example.module1.service.AuthService;
import com.example.module1.service.UserService;
import com.example.module1.service.impl.AuthServiceImpl;
import com.example.module1.service.impl.UserDetailsServiceImpl;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.payload.BibResponse;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(path = "/api/v1/admin")
@AllArgsConstructor
public class AdminController {

    private UserService userService;
    private AuthService authService;
    private UserRepository userRepository;

    @PutMapping(path = "/role")
    public BibResponse updateUserById(@RequestParam(name = "id") Integer id, @RequestParam(name = "role") String role){
        BibResponse bibResponse = userService.updateUserRoleById(id, role);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, bibResponse);
    }

    @PutMapping(path = "/company")
    public BibResponse updateUserByCompanyId(@RequestParam(name = "id") Integer id, @RequestParam(name = "companyId") Integer companyId){
        BibResponse bibResponse = userService.updateUserCompanyById(id, companyId);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, bibResponse);
    }

    @PutMapping(path = "/verify")
    public BibResponse verifyUser(@RequestParam(name = "id") Integer id, @RequestParam(name = "decision") String decision){
        BibResponse bibResponse = authService.verifyUser(id, decision);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, bibResponse);
    }
}
