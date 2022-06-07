package com.example.trainingbase.dto;

import lombok.Data;

@Data
public class InvestorStatusDto {
    private String investorId;
    private String name;
    private String status;
    private String createdAt;
    private String updatedAt;
}
