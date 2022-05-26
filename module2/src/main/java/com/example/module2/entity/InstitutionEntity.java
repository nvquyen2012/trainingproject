package com.example.module2.entity;

import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(schema = "public", name = "Institution")
public class InstitutionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;

    @ManyToOne()
    @JoinColumn(name = "institution_assetAllocation")
    private AssetAllocationEntity assetAllocationEntity;
}
