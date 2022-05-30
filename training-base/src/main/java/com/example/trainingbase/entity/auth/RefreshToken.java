package com.example.trainingbase.entity.auth;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Getter
@Setter
@Table(name = "refresh_token", schema = "auth_bib")
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@Slf4j
public class RefreshToken {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @OneToOne
    @JoinColumn(name = "auth_user_id", referencedColumnName = "id")
    private AuthUser authUser;

    @Column(nullable = false, unique = true)
    private String token;

    @Column(nullable = false)
    private Instant expiryDate;

    public RefreshToken(AuthUser authUser, String token, Instant expiryDate) {
        this.authUser = authUser;
        this.token = token;
        this.expiryDate = expiryDate;
    }
}
