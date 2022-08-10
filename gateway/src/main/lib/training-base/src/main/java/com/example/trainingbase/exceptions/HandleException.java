package com.example.trainingbase.exceptions;

import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.payload.BibResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;
import java.util.Arrays;

@ControllerAdvice
@ResponseBody
@Slf4j
public class HandleException {
    @Autowired
    private ConvertJsonUtils convertJsonUtils;

    @ExceptionHandler(BusinessException.class)
    public BibResponse handleBusinessException(BusinessException businessException) {
        BibResponse response = BibResponse.error(businessException.getCode(), businessException.getMessage());
        return response;
    }

    @ExceptionHandler({IllegalStateException.class})
    public BibResponse handleIllegalException(IllegalStateException illegalStateException) {
        log.error("IllegalStateException => rootCause: {}", Arrays.stream(illegalStateException.getStackTrace()).findFirst());
        log.error("IllegalStateException => localizedMessage: {}", illegalStateException.getMessage());
        BibResponse response = BibResponse.error(HttpStatusConstants.NULL_POINTER_OR_BAD_REQUEST_CODE, HttpStatusConstants.NULL_POINTER_OR_BAD_REQUEST_MESSAGE);
        return response;
    }

    @ExceptionHandler({NullPointerException.class})
    public BibResponse handleNullPointerException(NullPointerException nullPointerException) {
        log.error("NullPointerException => rootCause: {}", Arrays.stream(nullPointerException.getStackTrace()).findFirst());
        log.error("NullPointerException => localizedMessage: {}", nullPointerException.getMessage());
        BibResponse response = BibResponse.error(HttpStatusConstants.NULL_POINTER_OR_BAD_REQUEST_CODE, HttpStatusConstants.NULL_POINTER_OR_BAD_REQUEST_MESSAGE);
        return response;
    }

    @ExceptionHandler({SQLException.class, Exception.class})
    public BibResponse handleSQLException(SQLException sqlException, Exception exception) {
        BibResponse response = new BibResponse();

        if (exception != null) {
            response = BibResponse.error(HttpStatusConstants.UNAVAILABLE_CODE, HttpStatusConstants.UNAVAILABLE_MESSAGE);
            log.error(convertJsonUtils.convertObjToString(response));
            log.error("Exception => rootCause: {}", Arrays.stream(exception.getStackTrace()).findFirst());
            log.error("Exception => Cause: {}", exception.getMessage());
            log.error("Exception =>", exception.getStackTrace());
        }
        if (sqlException != null) {
            response = BibResponse.error(HttpStatusConstants.SQL_CONNECTION_ERROR_CODE, HttpStatusConstants.SQL_CONNECTION_ERROR_MESSAGE);
            log.error("Exception => rootCause: {}", Arrays.stream(sqlException.getStackTrace()).findFirst());
            log.error("SQLException => Cause:", sqlException.getStackTrace());
        }
        return response;
    }

    @ExceptionHandler(TwoFactorException.class)
    public BibResponse handleTwoFactorException(TwoFactorException twoFactorException) {
        BibResponse response = BibResponse.builder().code(twoFactorException.getCode()).message(twoFactorException.getMessage()).data(twoFactorException.getData()).build();
        return response;
    }
}






