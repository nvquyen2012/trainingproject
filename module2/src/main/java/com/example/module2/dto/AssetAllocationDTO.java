package com.example.module2.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class AssetAllocationDTO {
    private int id;

    @JsonProperty("institution_title")
    private String institutionTitle;

    @JsonProperty("updated_at")
    private LocalDate updateAt;
}
