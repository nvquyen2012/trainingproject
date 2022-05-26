package com.example.module2.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(schema = "public", name = "Investment")
public class InvestmentManagerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String code;
    private String name;
    @JsonProperty("full_name")
    private String fullName;
    @JsonProperty("icon_url")
    private String iconUrl;
    @JsonProperty("product_count")
    private int productCount;

    @OneToMany(mappedBy = "investmentManagerEntity")
    private List<DataEntity> dataEntities = new ArrayList<>();
}
