package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum Education {
    PRIMARY_SCHOOL(1, "Primary_School"),
    JUNIOR_HIGH_SCHOOL(2, "Junior_High_School"),
    SENIOR_HIGH_SCHOOL(3, "Senior_High_School"),
    DIPLOMA(4, "Diploma"),
    UNDERGRADUATE(5, "Undergraduate"),
    POST_GRADUATE(6, "Post_Graduate"),
    DOCTORAL_PROGRAM(7, "Doctoral_Program"),
    OTHERS(8, "Others");

    private final Integer value;
    private final String label;

    Education(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static Education findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
