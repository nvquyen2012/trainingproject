package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum CompanyCharacteristic {
    STATE_OWNED_COMPANY(1, "State_Owned_Company"),
    PRIVATE(2, "Private"),
    SOCIAL(3, "Social"),
    JOINT_VENTURE(4, "Joint_Venture"),
    PMA_FOREIGN_INVESTMENT_COMPANY(5, "PMA_Foreign_Investment_Company"),
    FAMILY_COMPANY(6, "Family_Company"),
    AFFILIATION(7, "Affiliation"),
    OTHERS(8, "Others");

    private final Integer value;
    private final String label;

    CompanyCharacteristic(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static CompanyCharacteristic findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
