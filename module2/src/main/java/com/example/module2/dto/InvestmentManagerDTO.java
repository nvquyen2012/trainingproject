package com.example.module2.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class InvestmentManagerDTO {
    private int id;
    private String code;
    private String name;
    @JsonProperty("full_name")
    private String fullName;
    @JsonProperty("icon_url")
    private String iconUrl;
    @JsonProperty("product_count")
    private int productCount;
}
