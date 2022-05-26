package com.example.module2.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class InstrumentDTO {
    private int id;
    private Double percentage;
    private String name;
}
