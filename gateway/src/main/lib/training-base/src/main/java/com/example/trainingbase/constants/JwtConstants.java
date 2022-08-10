package com.example.trainingbase.constants;

public class JwtConstants {
    public static final long EXPIRATION_TIME = 43200000; // 12 h
    public static final long TOKEN_24H_TIME = 86400000;// 24 h
    public static final long TOKEN_TEST_TIME = 60000; //60s
    public static final String SECRET = "$2y$10$ibD0TTC.m4Kc.Vk9Q1o1sODigtxScJzDDUOPZ0xOGtTLLfRtTFATq";
    public static final String PREFIX_TOKEN = "Bearer ";
    public static final String AUTHORIZATION = "Authorization";
}
