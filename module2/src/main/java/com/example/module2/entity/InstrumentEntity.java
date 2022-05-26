package com.example.module2.entity;

import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(schema = "public", name = "Instrument")
public class InstrumentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private Double percentage;
    private String name;

    @ManyToOne()
    @JoinColumn(name = "instrument_assetAllocation")
    private AssetAllocationEntity assetAllocationEntity;
}