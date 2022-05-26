package com.example.trainingbase.exceptions;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TwoFactorException extends RuntimeException{
    private String code;
    private String message;
    private Object data;

    public TwoFactorException(String code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }
}
