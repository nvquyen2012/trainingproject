package com.example.module2.dto;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class NavDTO {
    private int id;
    private LocalDate date;
    private BigDecimal value;
}
