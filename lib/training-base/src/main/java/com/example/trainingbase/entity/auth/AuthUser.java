package com.example.trainingbase.entity.auth;


import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Collections;

@Entity
@Getter
@Setter
@Table(name = "auth_user", schema = "auth_bib")
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class AuthUser implements UserDetails {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "full_name")
    private String fullName;
    @Basic
    @Column(name = "image")
    private String image;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "password")
    private String password;
    @Basic
    @Column(name = "phone_number")
    private String phoneNumber;
    @Basic
    @Column(name = "country_phone_prefix")
    private String countryPhonePrefix;
    @Basic
    @Column(name = "roles")
    private String role;
    @Basic
    @Column(name = "workspace")
    private int workspace;
    @Basic
    @Column(name = "status")
    private String status;
    @Basic
    @Column(name = "login_fail_count")
    private Integer loginFailCount;
    @Basic
    @Column(name = "company_id")
    private int companyId;
    @Basic
    @Column(name = "last_login")
    private Timestamp lastLogin;
    @Basic
    @Column(name = "password_expired_date")
    private Timestamp expireDate;
    @Basic
    @Column(name = "created_at")
    private Timestamp createdAt;
    @Basic
    @Column(name = "updated_at")
    private Timestamp updatedAt;
    @Basic
    @Column(name = "created_by")
    private String createdBy;
    @Basic
    @Column(name = "updated_by")
    private String updatedBy;
    @Basic
    @Column(name = "username")
    private String username;

    @Enumerated(EnumType.STRING)
    private AuthUserRole authUserRole;
    private Boolean locked;
    private Boolean enabled;

    public AuthUser(String fullName, String image, String email, String password, String phoneNumber, String countryPhonePrefix, String role, int workspace, String status, Integer loginFailCount, int companyId, Timestamp lastLogin, Timestamp expireDate, Timestamp createdAt, Timestamp updatedAt, String createdBy, String updatedBy, String username, AuthUserRole authUserRole, Boolean locked, Boolean enabled) {
        this.fullName = fullName;
        this.image = image;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.countryPhonePrefix = countryPhonePrefix;
        this.role = role;
        this.workspace = workspace;
        this.status = status;
        this.loginFailCount = loginFailCount;
        this.companyId = companyId;
        this.lastLogin = lastLogin;
        this.expireDate = expireDate;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.createdBy = createdBy;
        this.updatedBy = updatedBy;
        this.username = username;
        this.authUserRole = authUserRole;
        this.locked = locked;
        this.enabled = enabled;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(authUserRole.name());
        return Collections.singletonList(authority);
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return !locked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return enabled;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }
}
