package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum FATCA {

    REGISTERED_DEEMED_COMPLIANT_FFI(1, "Registered_Deemed-Compliant_FFI"),
    CERTIFIED_DEEMED_COMPLIANT_FFI(2, "Certified Deemed-Compliant FFI"),
    OWNER_DOCUMENTED_FFI(3, "Owner-Documented FFI"),
    OWNER_DOCUMENTED_FFI_WITH_SPECIFIED_US_OWNER(4, "Owner-Documented FFI with Specified U.S. Owner"),
    PARTICIPATING_FFI(5, "Participating FFI"),
    NONPARTICIPATING_FFI(6, "Nonparticipating FFI"),
    ACTIVE_NFFE(7, "Active NFFE"),
    PASSIVE_NFFE_WITH_SUBSTANTIAL_US_OWNER(8, "Passive NFFE with Substantial_US_Owner"),
    PASSIVE_NFFE_WITHOUT_SUBSTANTIAL_US_OWNER(9, "Passive NFFE without Substantial_US_Owner"),
    DIRECT_REPORTING_NFFE(10, "Direct Reporting NFFE"),
    EXEMPT_BENEFICIAL_OWNER(11, "Exempt Beneficial Owner"),
    US_FINANCIAL_INSTITUTION(12, "U.S. Financial Institution");

    private final Integer value;
    private final String label;

    FATCA(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static FATCA findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
