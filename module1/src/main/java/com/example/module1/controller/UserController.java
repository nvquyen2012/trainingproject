package com.example.module1.controller;

import com.example.module1.dto.RegisterUserInfo;
import com.example.module1.service.UserService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.payload.BibResponse;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(path = "/api/v1/user")
@AllArgsConstructor
public class UserController {
    private UserService userService;

    //TODO: specifications -> getmapping
    @GetMapping(path = "/id")
    public AuthUser findById(@RequestParam(name = "id") Integer Id){
        return userService.findById(Id);
    }

    @GetMapping(path = "/email")
    public AuthUser findByEmail(@RequestParam(name = "email") String email){
        return userService.findByEmail(email);
    }

    @GetMapping(path = "/companyId")
    public AuthUser findByCompanyId(@RequestParam(name = "companyId") Integer companyId){
        return userService.findByCompanyId(companyId);
    }

    @DeleteMapping(path = "/delete/id")
    public BibResponse deleteUserById(@RequestParam(name = "id") Integer id){
        userService.deleteById(id);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, id);
    }

    @DeleteMapping(path = "/delete/email")
    public BibResponse deleteUserByEmail(@RequestParam(name = "email") String email){
        userService.deleteByEmail(email);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, email);
    }

    @PutMapping(path = "/update")
    public BibResponse updateUserById(@RequestParam(name = "id") Integer id, @RequestBody @Valid RegisterUserInfo registerUserInfo){
        BibResponse bibResponse = userService.updateUserById(id, registerUserInfo);
        return new BibResponse(HttpStatusConstants.SUCCESS_CODE, HttpStatusConstants.SUCCESS_MESSAGE, bibResponse);
    }

}
