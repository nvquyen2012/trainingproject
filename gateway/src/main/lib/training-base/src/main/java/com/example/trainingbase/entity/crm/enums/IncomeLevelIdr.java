package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum IncomeLevelIdr {
    UNDER_1_BILLION("< 1 billion/Year", 1),
    FROM_1_TO_5_BILLION("> 1 - 5 billion/Year", 2),
    FROM_5_TO_10_BILLION("> 5 - 10 billion/Year", 3),
    FROM_10_TO_50("> 10 - 50 billion/Year", 4),
    OVER_50("> 50 billion/Year", 5);

    private final String label;
    private final Integer value;

    IncomeLevelIdr(String label, int value){
        this.label = label;
        this.value = value;
    }

    public String label(){
        return this.label;
    }
    public int value() {
        return this.value;
    }

    public static IncomeLevelIdr findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
