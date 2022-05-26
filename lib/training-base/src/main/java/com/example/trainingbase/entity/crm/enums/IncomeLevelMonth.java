package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum IncomeLevelMonth {
    BELOW_RP850_000(1, "Below Rp850_000"),
    RP850_000_RP4_000_000(2, "Rp850_000 - Rp4_000_000"),
    RP4_000_001_RP_8_000_000(3, "Rp4_000_001 - Rp 8_000_000"),
    RP8_000_001_RP41_000_000(4, "Rp8_000_001 - Rp41_000_000"),
    RP41_000_001_RP83_000_000(5, "Rp41_000_001 - Rp83_000_000"),
    ABOVE_RP83_000_000(6, "Above Rp83_000_000");


    private final Integer value;
    private final String label;

    IncomeLevelMonth(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static IncomeLevelMonth findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
