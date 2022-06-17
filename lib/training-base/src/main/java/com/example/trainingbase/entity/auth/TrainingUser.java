package com.example.trainingbase.entity.auth;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

@Getter
public class TrainingUser extends User {

    @Setter(AccessLevel.PUBLIC)
    private Long userId;

    @Setter(AccessLevel.PUBLIC)
    private Boolean isFirstLogin;

    public TrainingUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public TrainingUser(Long userId, String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.userId = userId;
    }

    public TrainingUser(Long userId, Boolean isFirstLogin, String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.userId = userId;
        this.isFirstLogin = isFirstLogin;
    }
}
