package com.test.trainingbase.exceptions;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ImageException extends RuntimeException {
    private String code;
    private String message;

    public ImageException(String code, String message) {
        this.code = code;
        this.message = message;
    }
}