package com.example.trainingbase.entity.auth;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "confirmation_token", schema = "auth_bib")
@NoArgsConstructor
public class ConfirmationToken {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(nullable = false, name = "token")
    private String token;
    @Column(nullable = false, name = "created_at")
    private LocalDateTime createdAt;
    @Column(nullable = false, name = "expires_at")
    private LocalDateTime expiresAt;

    @Column(name = "confirmed_at")
    private LocalDateTime confirmedAt;

    @ManyToOne
    @JoinColumn(
            nullable = false,
            name = "auth_user_id"
    )
    private AuthUser authUser;

    public ConfirmationToken(String token, LocalDateTime createdAt, LocalDateTime expiresAt, AuthUser authUser) {
        this.token = token;
        this.createdAt = createdAt;
        this.expiresAt = expiresAt;
        this.authUser = authUser;
    }
}
