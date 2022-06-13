package com.example.trainingbase.constants;

public class HttpStatusConstants {
    //SUCCESS
    public final static String SUCCESS_CODE = "00000";
    public final static String SUCCESS_MESSAGE = "Successful";
    public final static String APPROVED_SUCCESS_MESSAGE = "Approved successful";
    public final static String REJECTED_SUCCESS_MESSAGE = "Rejected successful";
    public final static String ACTIVE_SUCCESS_MESSAGE = "Active successful";
    public final static String INACTIVE_SUCCESS_MESSAGE = " Deactivate successful";
    public final static String OTP_SEND_SUCCESS_MESSAGE = "OTP has been sent to your phone number";
    public final static String SEND_OTT_TO_EMAIL_SUCCESS_MESSAGE = "We have sent the OTT to your email!";
    public final static String VERIFY_NEW_DEVICE_SUCCESS_MESSAGE = "Your device has been verified!";
    public final static String RESET_PASSWORD_SUCCESS_MESSAGE = "Reset password success!";
    public final static String EDIT_USER_MESSAGE ="Edit user success!";
    //SORT
    public final static String SORT_INVALID = "Sort value invalid";

    //COMMON ERROR
    public final static String UNAVAILABLE_CODE = "99999";
    public final static String UNAVAILABLE_MESSAGE = "Sorry, our service is temporarily interrupted. Please try again later";

    //FAILURE
    public final static String FAILURE_CODE = "11111";
    public final static String FAILURE_MESSAGE = "Failure";

    // RESET PASSWORD
    public final static String RESET_PASSWORD_FAILURE_CODE = "10001";
    public final static String RESET_PASSWORD_FAILURE_MESSAGE = "Your account can not reset password! Please contact admin";

    // FIELD ROLE INVALID
    public final static String FIELD_ROLE_INVALID_CODE = "10002";
    public final static String FIELD_ROLE_INVALID_MESSAGE = "Role invalid !";

    // INACTIVE ACCOUNT LOGIN
    public final static String EXPIRED_PASSWORD_CODE = "10003";
    public final static String EXPIRED_PASSWORD_CODE_MESSAGE = "Your account had expired, please change password now!";

    // PENDING ACCOUNT LOGIN
    public final static String PENDING_ACCOUNT_CODE = "10004";
    public final static String PENDING_ACCOUNT_MESSAGE = "Your account has not been approved, please wait!";

    // REJECTED ACCOUNT LOGIN
    public final static String REJECTED_ACCOUNT_CODE = "10005";
    public final static String REJECTED_ACCOUNT_MESSAGE = "Your account has been rejected, please contact admin!";

    // INVALID LOGIN INFORMATION
    public final static String INVALID_LOGIN_INFORMATION_CODE = "10006";
    public final static String INVALID_LOGIN_INFORMATION_MESSAGE = "Invalid login information!";

    // EMAIL NOT ASSOCIATED
    public final static String EMAIL_NOT_EXISTS_CODE = "10007";
    public final static String EMAIL_NOT_EXISTS_MESSAGE = "Your email is not associated with any accounts. Let's create a new account.";

    // SQL EXCEPTION
    public final static String SQL_CONNECTION_ERROR_CODE = "10008";
    public final static String SQL_CONNECTION_ERROR_MESSAGE = "Some thing wrong with connection of database";

    // Null pointer exception
    public final static String NULL_POINTER_OR_BAD_REQUEST_CODE = "10009";
    public final static String NULL_POINTER_OR_BAD_REQUEST_MESSAGE = "You pass wrong input parameter or there is null pointer object";

    // REQUIRED ACTIVE PHONE NUMBER
    public final static String REQUIRE_ACTIVE_PHONE_CODE = "10010";
    public final static String REQUIRE_ACTIVE_PHONE_MESSAGE = "Your phone number has not been verified";

    // VERIFY_NEW_DEVICE
    public final static String VERIFY_NEW_DEVICE_CODE = "10011";
    public final static String VERIFY_NEW_DEVICE_MESSAGE = "You are signing in new device, please check your phone number to verify!";

    // WRONG_PASSWORD_MAXIMUM
    public final static String WRONG_PASSWORD_MAXIMUM_CODE = "10012";
    public final static String WRONG_PASSWORD_MAXIMUM_MESSAGE = "You've reached the maximum login attempts. Your account is now deactivated, please contact the administrator via email to reactivate your account";

    //UNAUTHORIZED WHEN LOGIN
    public final static String UNAUTHORIZED_CODE = "10000";
    public final static String UNAUTHORIZED_MESSAGE = "You are unauthorized!";

    // INVALID PASSWORD
    public final static String INVALID_PASSWORD_CODE = "10014";
    public final static String INVALID_PASSWORD_MESSAGE = "Password must contain number, letter, capital letter, symbol !";

    // INVALID COMPANY ID
    public final static String INVALID_COMPANY_ID_CODE = "10015";
    public final static String INVALID_COMPANY_ID_MESSAGE = "Company id is not exists!";

    // INVALID EMAIL
    public final static String INVALID_EMAIL_CODE = "10016";
    public final static String INVALID_EMAIL_MESSAGE = "Email invalid";

    //VALIDATION FIELD REGISTER
    public final static String INVALID_FIELD_CODE = "10017";
    public final static String INVALID_FIELD_MESSAGE = "Some fields invalid";

    // CANNOT_FIND_ACCOUNT
    public final static String CANNOT_FIND_ACCOUNT_CODE = "10018";
    public final static String CANNOT_FIND_ACCOUNT_MESSAGE = "Can not find this account!";

    // INVALID OTP
    public final static String INVALID_OTP_CODE = "10019";
    public final static String INVALID_OTP_MESSAGE = "Invalid OTP";

    // INVALID DEVICE
    public final static String INVALID_DEVICE_CODE = "10020";
    public final static String INVALID_DEVICE_MESSAGE = "Device is required";

    // VERIFY NEW DEVICE
    public final static String VERIFY_NEW_DEVICE_FAILURE_CODE = "10021";
    public final static String VERIFY_NEW_DEVICE_FAILURE_MESSAGE = "Your device can not be verified!";

    // EMAIL EXIST
    public final static String EMAIL_EXIST_CODE = "10022";
    public final static String EMAIL_EXIST_MESSAGE = "This email is existed";

    // USERNAME EXIST
    public final static String USERNAME_EXIST_CODE = "10023";
    public final static String USERNAME_EXIST_MESSAGE = "This username is existed";

    //
    public final static String OTP_IS_NOT_CONFIRMED_CODE = "10024";
    public final static String OTP_IS_NOT_CONFIRMED_MESSAGE = "Your OTP is not verified!";

    //
    public final static String USERNAME_INVALID_CODE = "10025";
    public final static String USERNAME_INVALID_MESSAGE = "Invalid username";

    //
    public final static String FIELD_STATUS_INVALID_CODE = "10026";
    public final static String FIELD_STATUS_INVALID_MESSAGE ="Invalid status";

    //
    public final static String INVALID_USER_ID_CODE = "10027";
    public final static String INVALID_USER_ID_MESSAGE = "User id is required";

    //
    public final static String CAN_NOT_EDIT_USER_CODE ="10028";
    public final static String CAN_NOT_EDIT_USER_MESSAGE = "Can not edit this user";

    //
    public final static String CANNOT_SEND_EMAIL_CODE ="10029";
    public final static String CANNOT_SEND_EMAIL_MESSAGE ="Our email service is temporarily interrupted. Please try again later ";

    //
    public final static String CANNOT_FIND_COMPANY_CODE ="10030";
    public final static String CANNOT_FIND_COMPANY_MESSAGE ="Can't find that company";
    public final static String TYPE_INVALID_CODE ="10031";
    public final static String TYPE_INVALID_MESSAGE ="Type invalid!";

    public final static String INVESTOR_NOT_EXISTED_CODE ="10032";
    public final static String INVESTOR_NOT_EXISTED_MESSAGE ="Can not find investor!";

    //
    // IMAGE_ERROR_CODE
    public final static String IMAGE_ERROR_CODE = "10033";
    public final static String IMAGE_ERROR_MESSAGE_CREATE_DIRECTORY ="Error occurs when create directory";
    public final static String IMAGE_ERROR_MESSAGE_NOT_EXIST ="Image not exist";
    public final static String IMAGE_ERROR_MESSAGE_GET_IMAGE ="Error occurs when get image";

    // Invalid params
    public final static String INVALID_DATA_CODE = "10034";
    public final static String INVALID_DATA_MESSAGE = "Invalid data";

    public final static String UPDATE_INVESTOR_SUCCESS_CODE ="10035";
    public final static String UPDATE_INVESTOR_SUCCESS_MESSAGE ="Update investor successfully";

    public final static String INACTIVE_ACCOUNT_CODE ="10036";
    public final static String INACTIVE_ACCOUNT_MESSAGE ="Your account is inactive, please contact admin to re-active";

    public final static String UPDATE_STATUS_INVESTOR_SUCCESS_CODE ="10035";
    public final static String UPDATE_STATUS_INVESTOR_SUCCESS_MESSAGE ="Update status investor successfully";

    public final static String STATUS_INVALID_CODE ="10036";
    public final static String STATUS_INVALID_MESSAGE ="Invalid status";

    public final static String INVALID_SIGN_METHOD_CODE = "10037";
    public final static String INVALID_SIGN_METHOD_MESSAGE = "Invalid sign method";

    public final static String COMPANY_NOT_EXISTED_CODE = "10038";
    public final static String COMPANY_NOT_EXISTED_MESSAGE = "Can not find company!";

    public final static String COMPANY_EXIST_CODE = "10039";
    public final static String COMPANY_EXIST_MESSAGE = "This Company Name is existed";

    public final static String FORBIDDEN_CODE = "10040";
    public final static String FORBIDDEN_MESSAGE = "Forbidden";

//  public final static String UPDATE_INFOR_INVESTOR_SUCCESS_CODE = "100401";
    public final static String UPDATE_INFOR_INVESTOR_SUCCESS_MESSAGE = "Update information of investor successfully";

    public final static String WRONG_OTT_OVER_THREE_TIME_CODE = "10041";
    public final static String WRONG_OTT_OVER_THREE_TIME_MESSAGE = "You pass wrong ott code over three time. Your account will be deactivated. Please contact the administrator to unlock the account";

    public final static String REFRESH_TOKEN_EXPIRED_CODE = "10042";
    public final static String REFRESH_TOKEN_EXPIRED_MESSAGE = "Invalid token !";

    public final static String INVALID_INSTRUCTION_ID_CODE = "10043";
    public final static String INVALID_INSTRUCTION_ID_MESSAGE = "This instruction doesn't exist";

    // lead management
    public final static String LEAD_NOT_FOUND_CODE = "10050";
    public final static String LEAD_NOT_FOUND_MESSAGE = "Lead is not found!";
    // Instruction

    public static final String INSTRUCTION_INVESTOR_ID = "Investor is not null or empty";
    public static final String INSTRUCTION_PRODUCT_ID_= "Product is not null or empty";


    public static final String INSTRUCTION_INVESTOR_FEE = "Fee is not null";
    public static final String INSTRUCTION_INVESTOR_TRANSACTION_DATE = "Transaction date is not null";
    public static final String INSTRUCTION_INVESTOR_AMOUNTCCY = "Amount is not null";
    public static final String INSTRUCTION_INVESTOR_NUMBER_OF_UNIT = "Number of unit is not null";
    public static final String INSTRUCTION_SWITCH_OUT_PRODUCT = "Switch out product is not null";
    public static final String INSTRUCTION_SWITCH_IN_PRODUCT = "Switch out product is not null";

    public static final String WAIT_60_SECONDS_CODE = "10051";
    public static final String WAIT_60_SECONDS_MESSAGE = "Please wait 60 seconds to resend otp !";
}
