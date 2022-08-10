package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum CompanyType {
    CORPORATE(1, "Corporate"),
    FOUNDATION(2, "Foundation"),
    FINANCIAL_INSTITUTION(3, "Financial_Institution"),
    INSURANCE(4, "Insurance"),
    MUTUAL_FUND(5, "Mutual_Fund"),
    PENSION_FUND(6, "Pension_Fund"),
    SECURITIES_COMPANY(7, "Securities_Company");

    private final Integer value;
    private final String label;

    CompanyType(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static CompanyType findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
