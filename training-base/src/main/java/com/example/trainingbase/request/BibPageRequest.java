package com.example.trainingbase.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BibPageRequest {

    private Integer page;

    private Integer size;

    private String filter;

    private String sortColumn;

    private String sortType;
}
