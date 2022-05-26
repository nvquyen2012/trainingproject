package com.example.module2.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(schema = "public", name = "AssetAllocation")
public class AssetAllocationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @JsonProperty("institution_title")
    private String institutionTitle;

    @JsonProperty("updated_at")
    private LocalDate updateAt;

    //AssetAllocation-Data
    @OneToMany(mappedBy = "assetAllocationEntity")
    private List<DataEntity> dataEntities = new ArrayList<>();

    //AssetAllocation-Institution
    @OneToMany(mappedBy = "assetAllocationEntity")
    private List<InstitutionEntity> institutionEntities = new ArrayList<>();

    //AssetAllocation-Instrument
    @OneToMany(mappedBy = "assetAllocationEntity")
    private List<InstrumentEntity> instrumentsEntities = new ArrayList<>();
}
