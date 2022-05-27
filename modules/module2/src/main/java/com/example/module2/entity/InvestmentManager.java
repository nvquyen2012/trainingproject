package com.example.module2.entity;

import com.example.trainingbase.entity.AbstractEntity;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(schema = "crm_bib")
public class InvestmentManager extends AbstractEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String code;
    private String name;
    private String fullName;
    private String iconUrl;
    private int productCount;

    @OneToMany(mappedBy = "investmentManager")
    private List<Data> data;
}