package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;

public enum InvestorStatus {
    SUBMITTED(1,"SUBMITTED"),
    PROCEEDED(2,"PROCEEDED"),
    APPROVED(3,"APPROVED"),
    REJECTED(4,"REJECTED"),
    FORM_REJECTED(5,"FORM_REJECTED"), HttpStatusConstants(, );
    private final Integer value;
    private final String label;

    InvestorStatus(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static InvestorStatus fromType(String type) {
        return Arrays.stream(values())
                .filter(e -> e.label().equalsIgnoreCase(type))
                .findFirst()
                .orElseThrow(() -> new BusinessException(HttpStatusConstants.STATUS_INVALID_CODE, HttpStatusConstants.STATUS_INVALID_MESSAGE));
    }
}
