package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum SourceOfFundIndividual {
    REVENUE(1, "Revenue"),
    BUSINESS_PROFIT(2, "Business_Profit"),
    SAVING_INTEREST(3, "Saving_interest"),
    LEGACY(4, "Legacy"),
    FUND_FROM_PARENTS_OR_CHILDREN(5, "Fund_from_parents_or_children"),
    GRANT(6, "Grant"),
    FUND_FROM_HUSBAND_OR_WIFE(7, "Fund_from_husband_or_wife"),
    DRAWING(8, "Drawing"),
    INVESTMENT_GAIN(9, "Investment_gain"),
    OTHERS(10, "Others");

    private final Integer value;
    private final String label;

    SourceOfFundIndividual(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static SourceOfFundIndividual findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
