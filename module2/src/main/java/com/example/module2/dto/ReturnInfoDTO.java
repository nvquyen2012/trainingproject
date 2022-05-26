package com.example.module2.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReturnInfoDTO {
    private int id;
    private Double percentage;
    private Double amount;
    @JsonProperty("graph_text")
    private String graphText;
}
