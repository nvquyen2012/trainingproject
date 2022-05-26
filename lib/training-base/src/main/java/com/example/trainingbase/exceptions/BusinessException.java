package com.example.trainingbase.exceptions;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
public class BusinessException extends RuntimeException{
    private String code;
    private String message;

    public BusinessException(String code, String message) {
        this.code = code;
        this.message = message;
    }
}
