package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum InvestorsRiskProfile {
    LOW(1, "Low"),
    MODERATE(2, "Moderate"),
    HIGH(3, "High");

    private final Integer value;
    private final String label;

    InvestorsRiskProfile(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static InvestorsRiskProfile findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
