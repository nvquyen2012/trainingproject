package com.example.module1.repository.specification;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
public class FilterInfo {
    private String field;
    private String operator;
    private String value;
    private List<String> values;
}
