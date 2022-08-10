package com.example.trainingbase.entity.crm;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "bank", schema = "crm_bib")
public class Bank {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Basic
    @Column(name = "bi_member_code")
    private String biMemberCode;

    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "translation")
    private String translation;
}
