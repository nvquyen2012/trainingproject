package com.example.trainingbase.service;

import com.example.trainingbase.entity.new_auth.User;
import lombok.SneakyThrows;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.security.auth.login.LoginException;
import java.util.Optional;

public class AuditorAwareImpl implements AuditorAware<Long> {

    @SneakyThrows
    @Override
    public Optional<Long> getCurrentAuditor() {
        Optional<Long> userId = Optional.empty();
        if(SecurityContextHolder.getContext() != null && SecurityContextHolder.getContext().getAuthentication() != null
        && SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal instanceof User) {
                userId = Optional.ofNullable(((User) principal).getId());
            }
        } else {
            throw new LoginException("No user login for operation");
        }
        return userId;
    }
}
