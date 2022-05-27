package com.example.module2.entity;

import com.example.trainingbase.entity.AbstractEntity;
import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(schema = "crm_bib")
public class Instrument extends AbstractEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Double percentage;
    private String name;

    @ManyToOne
    @JoinColumn(name = "data_id", nullable = false)
    private Data data;
}
