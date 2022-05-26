package com.example.trainingbase.entity.crm.enums;

import java.util.Arrays;
import java.util.NoSuchElementException;
import java.util.Objects;

public enum Occupation {
    STUDENT_GRADUATE_STUDENT_POST_GRADUATE(1, "Student_Graduate_Student_Post_Graduate"),
    HOUSEWIFE(2, "Housewife"),
    ENTREPRENEUR(3,"Entrepreneur"),
    CIVIL_SERVANT(4, "Civil_Servant"),
    INDONESIAN_NATIONAL_ARMED_FORCE_INDONESIAN_NATIONAL_POLICE(5, "Indonesian_National_Armed_Force_Indonesian_National_Police"),
    RETIREMENT(6, "Retirement"),
    LECTURER_TEACHER(7, "Lecturer_Teacher"),
    PRIVATE_EMPLOYEE(8, "Private_Employee"),
    OTHERS(9, "Others");

    private final Integer value;
    private final String label;

    Occupation(Integer value, String label) {
        this.value = value;
        this.label = label;
    }

    public int value() {
        return this.value;
    }
    public String label(){
        return this.label;
    }

    public static Occupation findByCode(Integer code) {
        return Arrays.stream(values()).
                filter(e -> Objects.equals(e.value(), code)).
                findFirst().
                orElseThrow(NoSuchElementException::new);
    }
}
