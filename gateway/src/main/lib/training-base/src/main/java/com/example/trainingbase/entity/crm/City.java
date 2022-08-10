package com.example.trainingbase.entity.crm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "city")
public class City  {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "city_code")
    private String cityCode;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "country_id")
    private int countryId;

}
