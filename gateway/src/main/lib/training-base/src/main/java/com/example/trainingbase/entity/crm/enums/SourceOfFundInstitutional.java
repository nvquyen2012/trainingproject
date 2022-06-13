package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum SourceOfFundInstitutional {
    BUSINESS_PROFIT(1, "Business_Profit"),
    PENSION_FUNDS(2, "Pension_Funds"),
    SAVING_INTEREST(3, "Saving_Interest"),
    INVESTMENT_GAIN(4, "Investment_Gain"),
    OTHERS(5, "Others");

    private final Integer value;
    private final String label;

    SourceOfFundInstitutional(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static SourceOfFundInstitutional findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
