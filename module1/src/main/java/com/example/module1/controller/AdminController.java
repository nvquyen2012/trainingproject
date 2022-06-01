package com.example.module1.controller;

import com.example.module1.service.AuthService;
import com.example.module1.service.UserService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.payload.BibResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/api/v1/admin")
@RequiredArgsConstructor
public class AdminController {

    private final UserService userService;
    private final AuthService authService;

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
