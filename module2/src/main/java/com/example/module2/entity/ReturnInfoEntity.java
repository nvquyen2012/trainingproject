package com.example.module2.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(schema = "public", name = "ReturnInfo")
public class ReturnInfoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private Double percentage;
    private Double amount;
    @JsonProperty("graph_text")
    private String graphText;

    @ManyToOne
    @JoinColumn(name = "returnInfo_data")
    private DataEntity dataEntity;

}
