package com.example.trainingbase.entity.auth;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@Table(name = "auth_ott", schema = "auth_bib")
public class AuthOtt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "token", nullable = false)
    private String token;

    @Basic
    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    @Basic
    @Column(name = "for_action", nullable = false)
    private String forAction;

    @Basic
    @Column(name = "\"expired_date\"")
    private LocalDateTime expiredDate;

    @Basic
    @Column(name = "is_confirmed", nullable = false)
    private String isConfirmed;

    @Basic
    @Column(name = "email")
    private String email;

    @Basic
    @Column(name = "ott_send_time")
    private int ottSendTime;


}