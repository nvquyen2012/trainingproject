package com.example.trainingbase.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PageRequest {

    private Integer page;

    private Integer size;

    private String filter;

    private String sortColumn;

    private String sortType;
}
