package com.example.trainingbase.constants;

public class RegexConstant {
     public static final String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
     public static final String EMAIL_REGEX = "^[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,6}$";
}
