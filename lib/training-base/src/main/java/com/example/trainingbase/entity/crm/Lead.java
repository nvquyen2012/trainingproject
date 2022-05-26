package com.example.trainingbase.entity.crm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "lead", schema = "crm_bib")
public class Lead {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer rmId;
    private String fullName;
    private String email;
    private String mobileNumber;
    private String productOffered;
    private Double amount;
    private Double feeOffered;
    private String potentialRevenue;
    private String status;
}
