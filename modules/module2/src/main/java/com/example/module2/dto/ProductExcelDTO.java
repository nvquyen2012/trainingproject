package com.example.module2.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductExcelDTO {

    private String investmentManagerName;
    private String custodianBankName;
    private LocalDate launchDate;
    private Double minSubscription;


}
