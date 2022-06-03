package com.example.trainingbase.dto;

import lombok.*;

import java.time.LocalDateTime;

@Data
public class InvestorStatusDto {
    private String investorId;
    private String name;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
