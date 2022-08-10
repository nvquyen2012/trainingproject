package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum LeadStatus {
    INITIATE(1 , "Initiate"),
    NEGOTIATION(2 , "Negotiation"),
    CLOSE(3 , "Close"),
    DROP(4 , "Drop");

    private final Integer value;
    private final String label;

    LeadStatus(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static LeadStatus findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}