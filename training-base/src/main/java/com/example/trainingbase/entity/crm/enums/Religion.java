package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum Religion {
    ISLAM(1, "Islam"),
    PROTESTANT(2, "Protestant"),
    CATHOLIC(3, "Catholic"),
    HINDUISM(4, "Hinduism"),
    BUDHISM(5, "Budhism"),
    CONFUCIANISM(6, "Confucianism"),
    OTHERS(7, "Others");

    private final Integer value;
    private final String label;

    Religion(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static Religion findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
