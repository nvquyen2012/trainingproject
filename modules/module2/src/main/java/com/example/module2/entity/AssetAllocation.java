package com.example.module2.entity;

import com.example.trainingbase.entity.AbstractEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(schema = "crm_bib" )
public class AssetAllocation extends AbstractEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String institutionTitle;

    @OneToMany(mappedBy = "data")
    private List<Institution> institutions;

    @OneToMany(mappedBy = "data")
    private List<Instrument> instruments;

}
