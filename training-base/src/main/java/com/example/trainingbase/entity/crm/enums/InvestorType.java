package com.example.trainingbase.entity.crm.enums;

import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.exceptions.BusinessException;

import java.util.Arrays;

public enum InvestorType {
    INDIVIDUAL(1,"individual"),
    INSTITUTIONAL(2, "institutional");

    private final Integer value;
    private final String label;

    InvestorType(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    /**
     * Can throw BusinessException
     */
    public static InvestorType fromType(String type) {
        return Arrays.stream(values())
                .filter(e -> e.label().equalsIgnoreCase(type))
                .findFirst()
                .orElseThrow(() -> new BusinessException(HttpStatusConstants.TYPE_INVALID_CODE, HttpStatusConstants.TYPE_INVALID_MESSAGE));
    }
}
