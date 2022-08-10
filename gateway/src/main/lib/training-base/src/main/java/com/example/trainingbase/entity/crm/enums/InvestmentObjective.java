package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum InvestmentObjective {
    GAIN_FROM_PRICE_MARGIN(1, "Gain_from_price_margin"),
    INVESTMENT(2, "Investment"),
    SPECULATION(3, "Speculation"),
    GAIN_THE_REVENUE_OR_INCOME(4, "Gain_the_revenue_or_income"),
    OTHERS(5, "Others");

    private final Integer value;
    private final String label;

    InvestmentObjective(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static InvestmentObjective findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
