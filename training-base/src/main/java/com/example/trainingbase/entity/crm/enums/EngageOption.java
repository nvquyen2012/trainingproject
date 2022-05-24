package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum EngageOption {
    FACE_TO_FACE(1,"Face-to-face"),
    REMOTE(2,"Remote");

    private final Integer value;
    private final String label;

    EngageOption(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public Integer getValue() {
        return value;
    }

    public String getLabel() {
        return label;
    }

    public static EngageOption findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.getValue(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}