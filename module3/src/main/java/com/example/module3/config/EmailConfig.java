package com.example.module3.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmailConfig {
    String to;
//    String from;
    String subject;
//    String content;
}