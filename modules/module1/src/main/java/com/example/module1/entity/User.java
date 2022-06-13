package com.example.module1.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table
@Data
public class User {

    @Id
    @GeneratedValue
    private Long id;

    private String email;

    private String firstName;

    private String lastName;
}
