package com.example.trainingbase.payload;

import com.example.trainingbase.constants.HttpStatusConstants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BibResponse<T> {
    private String code;
    private String message;
    private T data;

    public static BibResponse ok(Object data) {
        return BibResponse.builder().code(HttpStatusConstants.SUCCESS_CODE).message(HttpStatusConstants.SUCCESS_MESSAGE).data(data).build();
    }

    public static BibResponse error(String code, String message) {
        return BibResponse.builder().code(code).message(message).build();
    }
    public static BibResponse buildAll(String code, String message, Object data) {
        return BibResponse.builder().code(code).message(message).data(data).build();
    }

}
