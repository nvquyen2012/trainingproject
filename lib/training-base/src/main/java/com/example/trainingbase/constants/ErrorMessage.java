package com.example.trainingbase.constants;

public interface ErrorMessage {

  // User
  public String USER_NOT_FOUND = "Người dùng không tìm thấy";
  public String USERNAME_OR_PASSWORD_NOT_CORRECT = "Tài khoản hoặc mật khẩu không đúng";
  public String USER_STATUS_NOT_FOUND = "Không tìm thấy vai trò";
  public String USER_ADDRESS_NOT_FOUND = "Không tìm thấy địa chỉ trên";
  public String USER_ACCESS_DENIED = "Truy cập bị từ chối";
  public String RECIPIENT_NOT_FOUND = "Không tìm thấy người nhận";
  public String SENDER_NOT_FOUND = "Không tìm thấy người gửi";
  public String USER_EMAIL_ALREADY_EXISTS = "Email đã được sử dụng";
  public String USER_PHONE_ALREADY_EXISTS = "Số điện thoại đã được sử dụng";
  public String COMPANY_CODE_ALREADY_EXISTS = "Mã công ty đã được sử dụng";
  public String USERNAME_ALREADY_EXISTS = "Tên đăng nhập đã được sử dụng";
  public String PASSWORD_NOT_CORRECT = "Mật khẩu không đúng";
  public String NEW_PASSWORD_NOT_VALID = "Mật khẩu mới không hợp lệ";
  public String USER_ALREADY_EXISTS = "Tên đăng nhập, số điện thoại, email hoặc mã công ty đã tồn tại";
  public String INVALID_RESET_PASSWORD_TOKEN = "Không tim thấy tài khoản hoặc đường dẫn đã hết hạn";

  // Operator
  public String OPERATOR_NOT_FOUND = "Không tìm thấy quản trị viên";

  // Role
  public String ROLE_NOT_FOUND = "Không tìm thấy vai trò";
  public String ROLE_ALREADY_EXISTS = "Vai trò đã tồn tại";
}
