package com.example.module1.controller;

import com.example.module1.model.RegisterUserInfo;
import com.example.module1.service.impl.UserDetailsServiceImpl;
import com.example.trainingbase.entity.auth.AuthUser;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(path = "/api/v1/user")
@AllArgsConstructor
public class UserController {
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @GetMapping(path = "/id")
    public AuthUser findById(@RequestParam(name = "id") Integer Id){
        return userDetailsServiceImpl.findById(Id);
    }

    @GetMapping(path = "/email")
    public AuthUser findByEmail(@RequestParam(name = "email") String email){
        return userDetailsServiceImpl.findByEmail(email);
    }

    @GetMapping(path = "/companyId")
    public AuthUser findByCompanyId(@RequestParam(name = "companyId") Integer companyId){
        return userDetailsServiceImpl.findByCompanyId(companyId);
    }

    @DeleteMapping(path = "/delete/id")
    public void deleteUserById(@RequestParam(name = "id") Integer id){
        userDetailsServiceImpl.deleteById(id);
    }

    @DeleteMapping(path = "/delete/email")
    public void deleteUserByEmail(@RequestParam(name = "email") String email){
        userDetailsServiceImpl.deleteByEmail(email);
    }

    @PutMapping(path = "/update")
    public void updateUserById(@RequestParam(name = "id") Integer id, @RequestBody @Valid RegisterUserInfo registerUserInfo){
        userDetailsServiceImpl.updateUserById(id, registerUserInfo);
    }

}
