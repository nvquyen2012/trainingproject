package com.example.trainingbase.entity.crm.enums;

import com.bukalapak.rm.constants.HttpStatusConstants;
import com.bukalapak.rm.exceptions.BusinessException;

import java.util.Arrays;
import java.util.Objects;

public enum SignMethod {
    REMOTE(1, "REMOTE"),
    FACE_TO_FACE(2, "FACE_TO_FACE");

    private final Integer value;
    private final String label;

    SignMethod(Integer value, String label) {
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
    public static SignMethod findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(() -> new BusinessException(HttpStatusConstants.INVALID_SIGN_METHOD_CODE,
                        HttpStatusConstants.INVALID_SIGN_METHOD_MESSAGE));
    }
}
