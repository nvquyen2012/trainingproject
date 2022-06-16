package com.example.trainingbase.entity.enums;

public enum EnumUserStatus {
  
  PENDING, ACTIVE, BANNED, REJECTED;

  public static EnumUserStatus findByName(String name) {
    for (EnumUserStatus status : EnumUserStatus.values()) {
      if (status.name().equalsIgnoreCase(name)) {
        return status;
      }
    }

    return null;
  }
}
