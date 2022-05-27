package com.example.module1.controller;

import com.example.module1.model.RegisterUserInfo;
import com.example.module1.service.impl.UserDetailsServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(path = "/api/v1/admin")
@AllArgsConstructor
public class AdminController {

    private UserDetailsServiceImpl userDetailsServiceImpl;

    @PutMapping(path = "/role")
    public void updateUserById(@RequestParam(name = "id") Integer id, @RequestParam(name = "role") String role){
        userDetailsServiceImpl.updateUserRoleById(id, role);
    }

    @PutMapping(path = "/company")
    public void updateUserByCompanyId(@RequestParam(name = "id") Integer id, @RequestParam(name = "companyId") Integer companyId){
        userDetailsServiceImpl.updateUserCompanyById(id, companyId);
    }

    @PutMapping(path = "/verify")
    public void verifyUser(@RequestParam(name = "id") Integer id, @RequestParam(name = "decision") String decision){
        userDetailsServiceImpl.verifyUser(id, decision);
    }
}
